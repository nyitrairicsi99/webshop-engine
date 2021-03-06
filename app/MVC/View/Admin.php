<?php
    namespace View;

    use Model\NavbarItem;
    use Controller\UserController;

    class Admin
    {
        public function __construct($page,$details = [],$selectedPage = 1,$maxpage = 1,$selectedSubPage = null)
        {
            UserController::getInstance();

            if ($selectedPage==0) {
                $maxpage = 1;
                $selectedPage = 1;
            }

            $theme = "default";
            
            if (!is_dir(__DIR__ . "/themes/" . $theme . "/admin/".$page)) {
                $page = "statistics";
            }

            include __DIR__ . "/themes/" . $theme . "/admin/sidenav/before.html";

            $navbar = [
                ['view_statistics',new NavbarItem(translate('statistics'),"admin/statistics",false,"fas fa-chart-area")],
                ['view_products',new NavbarItem(translate('products'),"admin/products",false,"fas fa-bars")],
                ['view_users',new NavbarItem(translate('users'),"admin/users",false,"fas fa-users")],
                ['manage_settings',new NavbarItem(translate('settings'),"admin/settings",false,"fas fa-cog")],
                ['view_orders',new NavbarItem(translate('orders'),"admin/orders",false,"fas fa-stream")],
                ['view_permissions',new NavbarItem(translate('permissions'),"admin/permissions",false,"fas fa-users-cog")],
                ['manage_addons',new NavbarItem(translate('addons'),"admin/addons",false,"fas fa-puzzle-piece")],
                ['view_coupons',new NavbarItem(translate('coupons'),"admin/coupons",false,"fas fa-tags")],
                ['admin_access',new NavbarItem(translate('back_to_shop'),"main",false,"fas fa-shopping-cart")],
            ];
            
            foreach($navbar as $row) {
                $perm = $row[0];
                if (UserController::$loggedUser->hasPermission($perm)) {
                    $item = $row[1];
                    $url = $item->link;
                    $name = $item->title;
                    $icon = $item->icon;
                    $active = "";
                    if ($GLOBALS['settings']['root_folder']."/admin/".$page==$url || $GLOBALS['settings']['root_folder']."/admin/".$page."s"==$url) {
                        $active = "active";
                    }
                    include __DIR__ . "/themes/" . $theme . "/admin/sidenav/row.html";
                }
            }
            include __DIR__ . "/themes/" . $theme . "/admin/sidenav/after.html";
            $onepage = $maxpage==1 ? 'onepage' : '';
            echo "<div class='adminpage'><div class='admincontent'><div class='tableholder $onepage'>";

            switch ($page) {
                case "users":
                    include __DIR__ . "/themes/" . $theme . "/admin/users/users.html";
                    break;
                case "orders":
                    include __DIR__ . "/themes/" . $theme . "/admin/orders/orders.html";
                    break;
                case "user":
                    $id = $details['id'];
                    $username = $details['username'];
                    $email = $details['email'];
                    $postcode = $details['postcode'];
                    $city = $details['city'];
                    $street = $details['street'];
                    $house_number = $details['house_number'];
                    $phone = $details['phone'];
                    $first_name = $details['first_name'];
                    $last_name = $details['last_name'];
                    $banned = $details['banned'];
                    
                    include __DIR__ . "/themes/" . $theme . "/admin/user/user.html";
                    include __DIR__ . "/themes/" . $theme . "/admin/user/personal.html";
                    break;
                case "settings":
                    $shopname = $details['shopname'];
                    $smtp_host = $details['smtp_host'];
                    $smtp_user = $details['smtp_user'];
                    $smtp_pass = $details['smtp_pass'];
                    include __DIR__ . "/themes/" . $theme . "/admin/settings/settings.html";
                    break;
                case "categories":
                    $categories = $details['used'];
                    include __DIR__ . "/themes/" . $theme . "/admin/categories/used.html";
                    $categories = $details['unused'];
                    include __DIR__ . "/themes/" . $theme . "/admin/categories/unused.html";
                    $categories = $details['main'];
                    $unused = $details['unused'];
                    include __DIR__ . "/themes/" . $theme . "/admin/categories/manage.html";
                    break;
                case "products":
                    $id = 1;
                    include __DIR__ . "/themes/" . $theme . "/admin/products/products.html";
                    break;
                case "product":
                    $categories = $details['categories'];
                    $currencies = $details['currencies'];
                    $currency_id = $details['currency'];
                    $category_id = $details['category'];
                    $id = $details['id'];

                    $name = $details['product']->name;
                    $description = $details['product']->description;
                    $price = $details['product']->price;
                    $stock = $details['product']->stock;
                    $availablefrom = explode(" ",$details['product']->availablefrom)[0];
                    $availableto = explode(" ",$details['product']->availableto)[0];
                    $alwaysavailable = $details['product']->alwaysavailable;
                    $gallery = $details['product']->gallery;
                    include __DIR__ . "/themes/" . $theme . "/admin/product/product.html";
                    break;
                case "addproduct":
                    $categories = $details['categories'];
                    $currencies = $details['currencies'];
                    include __DIR__ . "/themes/" . $theme . "/admin/addproduct/new.html";
                    break;
                case "languages":
                    $language = 0;
                    if (count($details)>0) {
                        $language = $details[0]['languages_id'];
                    }
                    include __DIR__ . "/themes/" . $theme . "/admin/languages/language.html";
                    break;
                case "coupons":
                    include __DIR__ . "/themes/" . $theme . "/admin/coupons/coupons.html";
                    break;
                case "createcoupon":
                    include __DIR__ . "/themes/" . $theme . "/admin/createcoupon/create.html";
                    break;
                case "permissions":
                    include __DIR__ . "/themes/" . $theme . "/admin/permissions/permissions.html";
                    break;
                case "permission":
                    $id = $details['id'];
                    $rank = $details['rank'];
                    include __DIR__ . "/themes/" . $theme . "/admin/permission/permission.html";
                    break;
                case "addons":
                    include __DIR__ . "/themes/" . $theme . "/admin/addons/addons.html";
                    break;
                case "statistics":
                    echo "<section class='statistics'>";
                        $key = "visitors_daily";
                        $header = "visitors_daily";
                        include __DIR__ . "/themes/" . $theme . "/admin/statistics/visitors.html";
                    echo "</section>";
                    echo "<section class='statistics'>";
                        $key = "visitors_monthly";
                        $header = "visitors_monthly";
                        include __DIR__ . "/themes/" . $theme . "/admin/statistics/visitors.html";
                    echo "</section>";
                    echo "<section class='statistics'>";
                        $key = "orders_daily";
                        $header = "orders_daily";
                        include __DIR__ . "/themes/" . $theme . "/admin/statistics/orders.html";
                    echo "</section>";
                    echo "<section class='statistics'>";
                        $key = "orders_monthly";
                        $header = "orders_monthly";
                        include __DIR__ . "/themes/" . $theme . "/admin/statistics/orders.html";
                    echo "</section>";
                    break;
                default:
                   echo "Admin page not set.";
            }

            echo "</div>";
            if ($maxpage!=1) {
                $pageTarget = 1;
                if (!($selectedSubPage==null)) {
                    $pageTargetUrlMin = $GLOBALS['settings']['root_folder']."/admin/".$page."/".$selectedPage."/1";
                    $pageTargetUrlMax = $GLOBALS['settings']['root_folder']."/admin/".$page."/".$selectedPage."/".$maxpage;
                } else {
                    $pageTargetUrlMin = $GLOBALS['settings']['root_folder']."/admin/".$page."/1";
                    $pageTargetUrlMax = $GLOBALS['settings']['root_folder']."/admin/".$page."/".$maxpage;
                }
                include __DIR__ . "/themes/" . $theme . "/admin/pagination/pagination.html";
            }
            echo "</div></div>";
            //echo "<div class='adminpage'>".$page."</div>";
        }

        private function hasPermission($perm) {
            UserController::getInstance();
            return UserController::$loggedUser->hasPermission($perm);
        }

        private function createStats($details) {
            $theme = "default";
            foreach ($details as $row) {
                $tag = $row['tag'];
                $count = $row['count'];
                include __DIR__ . "/themes/" . $theme . "/admin/statistics/row.html";
            }
        }

        private function createAddons($details) {
            $theme = "default";
            foreach ($details as $row) {
                $id = $row['id'];
                $name = $row['name'];
                $enabled = $row['enabled'];
                include __DIR__ . "/themes/" . $theme . "/admin/addons/row.html";
            }
        }

        private function createUsers($details) {
            $theme = "default";
            foreach ($details as $row) {
                $id = $row['id'];
                $username = $row['username'];
                $email = $row['email'];
                include __DIR__ . "/themes/" . $theme . "/admin/users/row.html";
            }
        }

        private function createRanks($details) {
            $theme = 'default';
            foreach($details['ranks'] as $rank) {
                $selected = $rank['id']==$details['rank'] ? 'selected' : '';
                $name = $rank['name'];
                include __DIR__ . "/themes/" . $theme . "/admin/user/rankrow.html";
            }
        }
        
        private function createOrders($details) {
            $theme = "default";
            foreach ($details['orders'] as $row) {
                $id = $row['id'];
                $date = $row['date'];
                $email = $row['email'];
                $price = $row['price'];
                $state = $row['state'];
                $sign = $row['sign'];
                $address = $row['address'];
                $name = $row['name'];
                include __DIR__ . "/themes/" . $theme . "/admin/orders/row.html";
            }
        }

        private function createStates($details,$state) {
            $theme = "default";
            foreach ($details['states'] as $row) {
                $id = $row['id'];
                $name = $row['name'];
                $selected = $state == $row['id'] ? "selected" : "";
                include __DIR__ . "/themes/" . $theme . "/admin/orders/staterow.html";
            }
        }

        private function createRows($selectedPage,$maxpage,$page,$selectedSubPage = null) {
            $theme = 'default';
            if (!($selectedSubPage==null)) {
                for ($i=$selectedSubPage-2;$i<$selectedSubPage+3;$i++){
                    $pageTarget = $i;
                    $pageTargetUrl = $GLOBALS['settings']['root_folder']."/admin/".$page."/".$selectedPage."/".$pageTarget;
                    if ($pageTarget>0 && $pageTarget<=$maxpage) {
                        $active = $selectedSubPage==$i ? "active" : "";
                        include __DIR__ . "/themes/" . $theme . "/admin/pagination/row.html";
                    }
                }
            } else {
                for ($i=$selectedPage-2;$i<$selectedPage+3;$i++){
                    $pageTarget = $i;
                    $pageTargetUrl = $GLOBALS['settings']['root_folder']."/admin/".$page."/".$pageTarget;
                    if ($pageTarget>0 && $pageTarget<=$maxpage) {
                        $active = $selectedPage==$i ? "active" : "";
                        include __DIR__ . "/themes/" . $theme . "/admin/pagination/row.html";
                    }
                }
            }
            
        }

        private function createThemes($details) {
            $theme = 'default';
            foreach($details['themes'] as $t) {
                $selected = $t['id']==$details['theme'] ? 'selected' : '';
                $name = $t['name'];
                include __DIR__ . "/themes/" . $theme . "/admin/settings/themerow.html";
            }
        }

        private function createLanguages($details) {
            $theme = 'default';
            foreach($details['languages'] as $t) {
                $id = $t['id'];
                $selected = $t['id']==$details['language'] ? 'selected' : '';
                $name = $t['name'];
                include __DIR__ . "/themes/" . $theme . "/admin/settings/languagerow.html";
            }
        }

        private function createCategories($type,$categories) {
            $theme = 'default';
            if ($type=="unused") {
                foreach($categories as $category) {
                    $name = $category['name'];
                    $id = $category['id'];
                    include __DIR__ . "/themes/" . $theme . "/admin/categories/unusedrow.html";
                }
            } elseif ($type=="used") {
                foreach($categories as $category) {
                    $name = $category['name'];
                    $id = $category['id'];
                    $subcategory = false;
                    include __DIR__ . "/themes/" . $theme . "/admin/categories/usedrow.html";
                    foreach($category["subcategories"] as $subcategory) {
                        $name = $subcategory['name'];
                        $id = $subcategory['id'];
                        $subcategory = true;
                        include __DIR__ . "/themes/" . $theme . "/admin/categories/usedrow.html";
                    }
                }
            }
        }

        private function createUnusedRows($categories) {
            $theme = 'default';
            foreach($categories as $category) {
                $name = $category['name'];
                $id = $category['id'];
                include __DIR__ . "/themes/" . $theme . "/admin/categories/unusedoption.html";
            }
        }

        private function createMainRows($categories) {
            $theme = 'default';
            $name = translate("none");
            $id = 0;
            include __DIR__ . "/themes/" . $theme . "/admin/categories/mainoption.html";
            foreach($categories as $category) {
                $name = $category['name'];
                $id = $category['id'];
                include __DIR__ . "/themes/" . $theme . "/admin/categories/mainoption.html";
            }
        }

        private function createNewItemCategories($categories) {
            $theme = 'default';
            foreach($categories as $category) {
                $name = $category['name'];
                $id = $category['id'];
                include __DIR__ . "/themes/" . $theme . "/admin/addproduct/categoryrow.html";
            }
        }

        private function createNewItemCurrencies($currencies) {
            $theme = 'default';
            foreach($currencies as $currency) {
                $name = $currency['name'];
                $id = $currency['id'];
                include __DIR__ . "/themes/" . $theme . "/admin/addproduct/currencyrow.html";
            }
        }

        private function createProductRows($products) {
            $theme = 'default';
            foreach($products as $product) {
                $name = $product->name;
                $id = $product->id;
                $price = $product->price;
                $stock = $product->stock;
                $priceStr = $price . $product->currency->sign;
                include __DIR__ . "/themes/" . $theme . "/admin/products/row.html";
            }
        }
        
        private function createProductCategories($categories,$selectedid) {
            $theme = 'default';
            foreach($categories as $category) {
                $name = $category['name'];
                $id = $category['id'];
                $selected = $selectedid==$id ? "selected" : "";
                include __DIR__ . "/themes/" . $theme . "/admin/product/categoryrow.html";
            }
        }

        private function createProductCurrencies($currencies,$selectedid) {
            $theme = 'default';
            foreach($currencies as $currency) {
                $name = $currency['name'];
                $id = $currency['id'];
                $selected = $selectedid==$id ? "selected" : "";
                include __DIR__ . "/themes/" . $theme . "/admin/product/currencyrow.html";
            }
        }

        private function createProductImages($gallery) {
            $theme = 'default';
            $first = true;
            foreach($gallery->images as $image) {
                include __DIR__ . "/themes/" . $theme . "/admin/product/sliderelement.html";
                $first = false;
            }
        }

        private function createPhrases($phrases,$page) {
            $theme = 'default';
            foreach($phrases as $phrase) {
                $id = $phrase['id'];
                $translated = $phrase['translated'];
                $language = $phrase['languages_id'];
                $phrase = $phrase['phrase'];
                include __DIR__ . "/themes/" . $theme . "/admin/languages/phraserow.html";
            }
        }

        private function createCoupons($coupons) {
            $theme = 'default';
            foreach($coupons as $coupon) {
                $id = $coupon['id'];
                $availablefrom = $coupon['start_time'];
                $availableto = $coupon['end_time'];
                $used = $coupon['used'];
                $code = $coupon['code'];
                $singleuse = $coupon['singleuse'];
                if ($singleuse==1) {
                    $singleuse = '<i class="fas fa-check-square"></i>';
                } else {
                    $singleuse = '<i class="far fa-square"></i>';
                }
                $discount = $coupon['discount'];
                include __DIR__ . "/themes/" . $theme . "/admin/coupons/row.html";
            }
        }

        private function createPermissionRow($details) {
            $theme = 'default';
            foreach($details as $rank) {
                $id = $rank['id'];
                $name = $rank['name'];
                include __DIR__ . "/themes/" . $theme . "/admin/permissions/row.html";
            }
        }

        private function createPermissions($details) {
            $theme = 'default';
            foreach($details['permissions'] as $permission) {
                $id = $permission['id'];
                $name = $permission['name'];
                $checked = $permission['granted']==1 ? "checked" : "";
                include __DIR__ . "/themes/" . $theme . "/admin/permission/row.html";
            }
        }
    }
    