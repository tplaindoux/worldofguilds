<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Zend\Session\Container as SessionContainer;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
       // $this->session = new SessionContainer('websiteInfos');
        //print_r($this->session->websiteLink);

    	//$config = $this->getServiceLocator()->get('config');
       // print_r($config['someVariable']);

        return new ViewModel();
    }
}
