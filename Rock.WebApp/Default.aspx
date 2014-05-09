<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Rock.WebApp.Default" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta content="text/html; charset=gb2312" />
    <title>Metronic | Data Tables - Managed Tables</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="Resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/style-metro.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/style.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/style-responsive.css" rel="stylesheet" type="text/css" />
    <link href="Resources/css/default.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="Resources/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="Resources/css/select2_metro.css" />
    <link rel="stylesheet" href="Resources/css/DT_bootstrap.css" />
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="Resources/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
    <!-- BEGIN HEADER -->
    <div class="header navbar navbar-inverse navbar-fixed-top">
        <!-- BEGIN TOP NAVIGATION BAR -->
        <div class="navbar-inner">
            <div class="container-fluid">
                <!-- BEGIN LOGO -->
                <a class="brand" href="Default.aspx">
                    <img src="Resources/image/logo.png" alt="logo" />
                </a>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                    <img src="Resources/image/menu-toggler.png" alt="" />
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <ul class="nav pull-right">
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown user"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img alt="" src="Resources/image/avatar1_small.jpg" />
                        <span class="username">Bob Nilson</span> <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="extra_profile.html"><i class="icon-user"></i>&nbsp;&nbsp;账户</a></li>
                            <li class="divider"></li>
                            <li><a href="login.html"><i class="icon-key"></i>&nbsp;&nbsp;退出</a></li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </ul>
                <!-- END TOP NAVIGATION MENU -->
            </div>
        </div>
        <!-- END TOP NAVIGATION BAR -->
    </div>
    <!-- END HEADER -->
    <!-- BEGIN CONTAINER -->
    <div class="page-container row-fluid">
        <!-- BEGIN SIDEBAR -->
        <div class="page-sidebar nav-collapse collapse">
            <!-- BEGIN SIDEBAR MENU -->
            <ul class="page-sidebar-menu">
                <li>
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                    <div class="sidebar-toggler hidden-phone">
                    </div>
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                </li>
                <li class=""><a href=""><i class="icon-bar-chart"></i><span class="title">微软雅黑</span>
                </a></li>
                <li class="active"><a href=""><i class="icon-bar-chart"></i><span class="title">微软雅黑</span>
                </a></li>
                <li class="last"><a href=""><i class="icon-bar-chart"></i><span class="title">微软雅黑</span>
                </a></li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
        <!-- END SIDEBAR -->
        <!-- BEGIN PAGE -->
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <div id="portlet-config" class="modal hide">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button">
                    </button>
                    <h3>
                        portlet Settings</h3>
                </div>
                <div class="modal-body">
                    <p>
                        Here will be a configuration form</p>
                </div>
            </div>
            <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <!-- BEGIN PAGE CONTAINER-->
            <div class="container-fluid">
                <!-- BEGIN PAGE HEADER-->
                <div class="row-fluid">
                    <div class="span12">
                        <!-- BEGIN STYLE CUSTOMIZER -->
                        <div class="color-panel hidden-phone">
                            <div class="color-mode-icons icon-color-close">
                            </div>
                            <div class="color-mode">
                                <p>
                                    THEME COLOR</p>
                                <ul class="inline">
                                    <li class="color-black current color-default" data-style="default"></li>
                                    <li class="color-blue" data-style="blue"></li>
                                    <li class="color-brown" data-style="brown"></li>
                                    <li class="color-purple" data-style="purple"></li>
                                    <li class="color-grey" data-style="grey"></li>
                                    <li class="color-white color-light" data-style="light"></li>
                                </ul>
                                <label>
                                    <span>Layout</span>
                                    <select class="layout-option m-wrap small">
                                        <option value="fluid" selected>Fluid</option>
                                        <option value="boxed">Boxed</option>
                                    </select>
                                </label>
                                <label>
                                    <span>Header</span>
                                    <select class="header-option m-wrap small">
                                        <option value="fixed" selected>Fixed</option>
                                        <option value="default">Default</option>
                                    </select>
                                </label>
                                <label>
                                    <span>Sidebar</span>
                                    <select class="sidebar-option m-wrap small">
                                        <option value="fixed">Fixed</option>
                                        <option value="default" selected>Default</option>
                                    </select>
                                </label>
                                <label>
                                    <span>Footer</span>
                                    <select class="footer-option m-wrap small">
                                        <option value="fixed">Fixed</option>
                                        <option value="default" selected>Default</option>
                                    </select>
                                </label>
                            </div>
                        </div>
                        <!-- END BEGIN STYLE CUSTOMIZER -->
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <h3 class="page-title">
                            Managed Tables <small>managed table samples</small>
                        </h3>
                        <!-- END PAGE TITLE & BREADCRUMB-->
                    </div>
                </div>
                <!-- END PAGE HEADER-->
                <!-- BEGIN PAGE CONTENT-->
                <div class="row-fluid">
                    <div class="span12">
                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-globe"></i>Managed Table</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a><a href="#portlet-config" data-toggle="modal"
                                        class="config"></a><a href="javascript:;" class="reload"></a><a href="javascript:;"
                                            class="remove"></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="clearfix">
                                    <div class="btn-group">
                                        <button id="btn_addNew" class="btn green">
                                            Add New <i class="icon-plus"></i>
                                        </button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button class="btn dropdown-toggle" data-toggle="dropdown">
                                            Tools <i class="icon-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu pull-right">
                                            <li><a href="#">Print</a></li>
                                            <li><a href="#">Save as PDF</a></li>
                                            <li><a href="#">Export to Excel</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <table class="table table-striped table-bordered table-hover" id="sample_1">
                                    <thead>
                                        <tr>
                                            <th style="width: 8px;">
                                                <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" />
                                            </th>
                                            <th>
                                                Username
                                            </th>
                                            <th class="hidden-480">
                                                Email
                                            </th>
                                            <th class="hidden-480">
                                                Points
                                            </th>
                                            <th class="hidden-480">
                                                Joined
                                            </th>
                                            <th>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                shuxer
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:shuxer@gmail.com">shuxer@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                120
                                            </td>
                                            <td class="center hidden-480">
                                                12 Jan 2012
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                looper
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:looper90@gmail.com">looper90@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                120
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2011
                                            </td>
                                            <td>
                                                <span class="label label-warning">Suspended</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                userwow
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@yahoo.com">userwow@yahoo.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                user1wow
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">userwow@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-inverse">Blocked</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                restest
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">test@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                foopl
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                19.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                weep
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                19.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                coop
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                19.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                pppol
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                19.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                test
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                19.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                userwow
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">userwow@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-inverse">Blocked</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                test
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">test@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                goop
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                weep
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                15.11.2011
                                            </td>
                                            <td>
                                                <span class="label label-inverse">Blocked</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                toopl
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                16.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                userwow
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">userwow@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                9.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-inverse">Blocked</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                tes21t
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">test@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                14.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                fop
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                13.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-warning">Suspended</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                kop
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                17.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                vopl
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                19.11.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                userwow
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">userwow@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-inverse">Blocked</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                wap
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">test@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                12.12.2012
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                test
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                19.12.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                toop
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                17.12.2010
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>
                                                <input type="checkbox" class="checkboxes" value="1" />
                                            </td>
                                            <td>
                                                weep
                                            </td>
                                            <td class="hidden-480">
                                                <a href="mailto:userwow@gmail.com">good@gmail.com</a>
                                            </td>
                                            <td class="hidden-480">
                                                20
                                            </td>
                                            <td class="center hidden-480">
                                                15.11.2011
                                            </td>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- END EXAMPLE TABLE PORTLET-->
                        <!-- BEGIN SAMPLE FORM PORTLET-->
                        <div class="portlet box blue" id="form_addNew">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-reorder"></i><span class="hidden-480">General Layouts</span>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label">
                                        Small Input</label>
                                    <div class="controls">
                                        <input type="text" placeholder="small" class="m-wrap small">
                                        <span class="help-inline">Some hint here</span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Meduam Input</label>
                                    <div class="controls">
                                        <input type="text" placeholder="medium" class="m-wrap medium">
                                        <span class="help-inline">Some hint here</span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Large Input</label>
                                    <div class="controls">
                                        <input type="text" placeholder="large" class="m-wrap large">
                                        <span class="help-inline">Some hint here</span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Huge Input</label>
                                    <div class="controls">
                                        <input type="text" placeholder="huge" class="m-wrap huge">
                                        <span class="help-inline">Some hint here</span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Disabled Input</label>
                                    <div class="controls">
                                        <input class="m-wrap medium" type="text" placeholder="Disabled input here..." disabled="">
                                        <span class="help-inline">Some hint here</span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Readonly Input</label>
                                    <div class="controls">
                                        <input class="m-wrap medium" readonly="" type="text" placeholder="Readonly input here..."
                                            disabled="">
                                        <span class="help-inline">Some hint here</span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Small Dropdown</label>
                                    <div class="controls">
                                        <select class="small m-wrap" tabindex="1">
                                            <option value="Category 1">Category 1</option>
                                            <option value="Category 2">Category 2</option>
                                            <option value="Category 3">Category 5</option>
                                            <option value="Category 4">Category 4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Medium Dropdown</label>
                                    <div class="controls">
                                        <select class="medium m-wrap" tabindex="1">
                                            <option value="Category 1">Category 1</option>
                                            <option value="Category 2">Category 2</option>
                                            <option value="Category 3">Category 5</option>
                                            <option value="Category 4">Category 4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Large Dropdown</label>
                                    <div class="controls">
                                        <select class="large m-wrap" tabindex="1">
                                            <option value="Category 1">Category 1</option>
                                            <option value="Category 2">Category 2</option>
                                            <option value="Category 3">Category 5</option>
                                            <option value="Category 4">Category 4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Radio Buttons</label>
                                    <div class="controls">
                                        <label class="radio">
                                            <div class="radio">
                                                <span>
                                                    <input type="radio" name="optionsRadios1" value="option1"></span></div>
                                            Option 1
                                        </label>
                                        <label class="radio">
                                            <div class="radio">
                                                <span class="checked">
                                                    <input type="radio" name="optionsRadios1" value="option2" checked=""></span></div>
                                            Option 2
                                        </label>
                                        <label class="radio">
                                            <div class="radio">
                                                <span>
                                                    <input type="radio" name="optionsRadios1" value="option2"></span></div>
                                            Option 3
                                        </label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Radio Buttons</label>
                                    <div class="controls">
                                        <label class="radio line">
                                            <div class="radio">
                                                <span>
                                                    <input type="radio" name="optionsRadios2" value="option1"></span></div>
                                            Option 1
                                        </label>
                                        <label class="radio line">
                                            <div class="radio">
                                                <span class="checked">
                                                    <input type="radio" name="optionsRadios2" value="option2" checked=""></span></div>
                                            Option 2
                                        </label>
                                        <label class="radio line">
                                            <div class="radio">
                                                <span>
                                                    <input type="radio" name="optionsRadios2" value="option2"></span></div>
                                            Option 3
                                        </label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Checkbox</label>
                                    <div class="controls">
                                        <label class="checkbox">
                                            <div class="checker">
                                                <span>
                                                    <input type="checkbox" value=""></span></div>
                                            Checkbox 1
                                        </label>
                                        <label class="checkbox">
                                            <div class="checker">
                                                <span>
                                                    <input type="checkbox" value=""></span></div>
                                            Checkbox 2
                                        </label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Checkbox</label>
                                    <div class="controls">
                                        <label class="checkbox line">
                                            <div class="checker">
                                                <span>
                                                    <input type="checkbox" value=""></span></div>
                                            Checkbox 1
                                        </label>
                                        <label class="checkbox line">
                                            <div class="checker">
                                                <span>
                                                    <input type="checkbox" value=""></span></div>
                                            Checkbox 2
                                        </label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Textarea</label>
                                    <div class="controls">
                                        <textarea class="medium m-wrap" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Large Textarea</label>
                                    <div class="controls">
                                        <textarea class="large m-wrap" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn blue">
                                        <i class="icon-ok"></i>Save</button>
                                    <button type="button" class="btn">
                                        Cancel</button>
                                </div>
                                </form>
                                <!-- END FORM-->
                            </div>
                        </div>
                        <!-- END SAMPLE FORM PORTLET-->
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
            <!-- END PAGE CONTAINER-->
        </div>
        <!-- END PAGE -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div class="footer">
        <div class="footer-inner">
            2013 &copy; Metronic by keenthemes.
        </div>
        <div class="footer-tools">
            <span class="go-top"><i class="icon-angle-up"></i></span>
        </div>
    </div>
    <!-- END FOOTER -->
    <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
    <!-- BEGIN CORE PLUGINS -->
    <script src="Resources/js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="Resources/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
    <script src="Resources/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="Resources/js/bootstrap.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]>

	<script src="Resources/js/excanvas.min.js"></script>

	<script src="Resources/js/respond.min.js"></script>  

	<![endif]-->
    <script src="Resources/js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="Resources/js/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="Resources/js/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="Resources/js/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="Resources/js/select2.min.js"></script>
    <script type="text/javascript" src="Resources/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="Resources/js/DT_bootstrap.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="Resources/js/app.js"></script>
    <script src="Resources/js/table-managed.js"></script>
    <script>

        jQuery(document).ready(function () {

            App.init();

            TableManaged.init();

            $("#btn_addNew").click(function () {
                App.scrollTo($("#form_addNew"), -50);
            });

        });

    </script>
</body>
<!-- END BODY -->
</html>
