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
use Zend\Session\Container as SessionContainer;

class Module
{

    public function onBootstrap( MvcEvent $e )
    {
        $currentSubdomain = $this->getCurrentSubdomain();

        $eventManager = $e->getApplication()->getEventManager();
        $sm = $e->getApplication()->getServiceManager();        
        $this->config = $config = $sm->get('Config');;

        $entityManager = $sm->get('Doctrine\ORM\EntityManager');
        $config = $entityManager->getRepository("\Application\Entity\Website")
                        ->findOneBy(array('link' =>  $currentSubdomain));

        if($config) {
            var_dump($config->toArray());
         //   $sm->setService('websiteId', $config['id']);


         //   print_r($this->config['someVariable']);
           // $config->setVariable('someVariable', $currentSubdomain);

           // $this->registerWebsiteInfos(config->toArray());

        }

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

    private function registerWebsiteInfos($array)
    {
            $this->session = new SessionContainer('websiteInfos');

            $this->website_id = $array['id']; 
            $this->website_id_creator = $array['id_creator']; 
            $this->website_id_owner = $array['id_owner']; 
            $this->website_id_plan = $array['id_plan']; 
            $this->website_name = $array['name']; 
            $this->website_link = $array['link']; 
            $this->website_credits = $array['credits']; 
            $this->website_timestamp_plan = $array['timestamp_plan']; 
            $this->website_timestamp_creation = $array['timestamp_creation']; 
            $this->website_timestamp_expiration = $array['timestamp_expiration']; 
            $this->website_expiration_reminder = $array['expiration_reminder']; 
            $this->website_status = $array['status']; 
            $this->website_active_theme = $array['active_theme'];

    }
    public function getCurrentSubdomain()
    {
        // Retrive and test the current subdomain
        $url    = $_SERVER['HTTP_HOST'];

        $host   = explode(".",$url);        

        $nb = count($host);
        
        // we have a subdomain, and it's not "www"
        return ($nb > 1 && ($host[0] != 'www') ) ? $host[0] :'portal';
    }

    public function loadWebsiteInfos($website_link)
    {        

        // If the subdomain is NOT the main or and is existing, we assign a variable
        return ($website_link != 'portal') ? true : false;
    }
}
