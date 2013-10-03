<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;

class Module
{
    public function onBootstrap(MvcEvent $e)
    {
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);


    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    private function getCurrentSubdomain($value='')
    {
        // Retrive and test the current subdomain
        $url    = $_SERVER['HTTP_HOST'];

        $host   = explode(".",$url);

        $nb = count($host);
        
        // we have a subdomain, and it's not "www"
        return ($nb > 1 && ($host[0] != 'www') ) ? $host[0] :'portal';
    }

    private function loadWebsiteInfos($website_link)
    {        

        // If the subdomain is NOT the main or and is existing, we assign a variable
        $isMain = ($website_link != 'portal') ? true : false;
    }
}
