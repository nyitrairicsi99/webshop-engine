<?php
    session_start();
    ini_set('max_file_uploads', '50');
    ini_set('file_uploads', 'On');
    ini_set('post_max_size', '100M');
    ini_set('upload_max_filesize', '100M');
    /*phpinfo();*/

    $loadFolders = array('utility','MVC/*');
    foreach ($loadFolders as $folder) {
        foreach (glob( __DIR__ . '/'.$folder.'/*.php') as $file) {
            require($file);   
        } 
    }
    global $settings;

    if ($GLOBALS['settings']['showErrors']) {
        error_reporting(E_ALL);
        ini_set('display_errors', 1);
    } else {
        error_reporting(0);
        ini_set('display_errors', 0);
    }

    $neededExtensions = array('pdo_mysql');
    foreach($neededExtensions as $extension) {
        if (!extension_loaded($extension)) {
            if ($GLOBALS['settings']['showErrors']) {
                die($extension." not enabled. <br />");
            }
            http_response_code(500);
            exit;
        }
    }

    //singletons
    use Controller\UserController;
    use Controller\SettingsController;
    use Controller\DatabaseConnection;
    use Controller\CategoryController;
    //normal classes
    use Controller\StoreController;
    use Controller\AdminController;
    use Controller\AdminActionController;
    use Controller\Router;
    use Controller\ProductController;
    use Model\Route;


    DatabaseConnection::getInstance();
    $pdo = DatabaseConnection::$connection;

    $router = new Router();

    CategoryController::getInstance();
    $categories = CategoryController::getCategories(true,false);
    foreach ($categories as $main) {
        if (count($main["subcategories"])==0) {
            $path = $main["short"];
            $router->addRoute(new Route($path,function($routeVarArr){
                new StoreController($routeVarArr[0]);
            },"GET"));
    
            $router->addRoute(new Route($path."/[0-9]",function($routeVarArr){
                new StoreController($routeVarArr[0]);
            },"GET"));
        } else {
            foreach ($main["subcategories"] as $sub) {
                $path = $sub["short"];
                $router->addRoute(new Route($path,function($routeVarArr){
                    new StoreController($routeVarArr[0]);
                },"GET"));
        
                $router->addRoute(new Route($path."/[0-9]",function($routeVarArr){
                    new StoreController($routeVarArr[0]);
                },"GET"));
            }
        }
    }


    $router->addRoute(new Route("",function($routeVarArr){
        redirect("main/1",$_GET);
    },"GET"));

    $router->addRoute(new Route("main",function($routeVarArr){
        redirect("main/1",$_GET);
    },"GET"));

    $router->addRoute(new Route("main/[0-9]",function($routeVarArr){
        new StoreController($routeVarArr[0]);
    },"GET"));

    
    $router->addRoute(new Route("product/[0-9]",function($routeVarArr){
        new ProductController($routeVarArr[0]);
    },"GET"));

    $router->addRoute(new Route("admin",function($routeVarArr){
        new AdminController('statistics',1);
    },"GET"));

    $router->addRoute(new Route("admin/[a-z]",function($routeVarArr){
        new AdminController($routeVarArr[1],1);
    },"GET"));

    $router->addRoute(new Route("admin/[a-z]/[0-9]",function($routeVarArr){
        new AdminController($routeVarArr[1],intval($routeVarArr[2]));
    },"GET"));

    $router->addRoute(new Route("[a-z]/[0-9]",function($routeVarArr){
        $action = $_POST['action'];
        new AdminActionController($routeVarArr[0],intval($routeVarArr[1]),$action,"POST");
    },"POST"));

    $router->addRoute(new Route("logout",function($routeVarArr){
        UserController::getInstance();
        UserController::logout();
    },"GET"));

    $router->addRoute(new Route("[a-z]",function($routeVarArr){
        switch ($routeVarArr[0]) {
            case 'login':
                UserController::getInstance();
                UserController::login();
                break;
            case 'register':
                UserController::getInstance();
                UserController::register();
                break;
            default:
                $action = $_POST['action'];
                new AdminActionController($routeVarArr[0],0,$action,"POST");
                break;
        }
    },"POST"));

    $router->setPathNotFound(function(){
        echo "no path";
    });

    $router->setMethodNotFound(function(){
        http_response_code(405);
        exit;
    });

    $router->resolveRoute();

?>