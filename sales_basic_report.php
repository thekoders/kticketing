<?php
require_once 'conf/smarty-conf.php';
include 'functions/user_functions.php';
include 'functions/inventory_functions.php';
include 'functions/sales_functions.php';

$module_no = 7;

if ($_SESSION ['login'] == 1) {
	if (check_access ( $module_no, $_SESSION ['user_id'] ) == 1) {
		if ($_REQUEST ['job'] == 'search') {
			unset ( $_SESSION ['searching'] );
			$_SESSION ['searching'] = 1;
			$_SESSION ['search_name'] = $_POST ['search_name'];
			$_SESSION ['search_no'] = $_POST ['search_no'];
			
			$smarty->assign ( 'org_name', "$_SESSION[org_name]" );
			$smarty->assign ( 'search_name', "$_SESSION[search_name]" );
			$smarty->assign ( 'search_no', "$_SESSION[search_no]" );
			$smarty->assign ( 'search_mode', "on" );
			$smarty->assign ( 'page', "Sales Basic Report" );
			$smarty->display ( 'sales_reports/sales_basic_report.tpl' );
		} elseif ($_REQUEST ['job'] == 'print') {
			$user_name = $_SESSION ['user_name'];
			$today = date ( "Y-m-d" );
			
			if ($_SESSION ['searching'] == 1) {
				$smarty->assign ( 'search_mode', "on" );
			}
			$smarty->assign ( 'org_name', "$_SESSION[org_name]" );
			$smarty->assign ( 'today', "$today" );
			$smarty->assign ( 'page', "Print Report" );
			$smarty->display ( 'sales_reports/basic_sales_print.tpl' );
		} else {
			unset ( $_SESSION ['searching'] );
			$smarty->assign ( 'org_name', "$_SESSION[org_name]" );
			$smarty->assign ( 'page', "Inventory Basic Report" );
			$smarty->display ( 'sales_reports/sales_basic_report.tpl' );
		}
	} 

	else {
		$user_name = $_SESSION ['user_name'];
		$smarty->assign ( 'org_name', "$_SESSION[org_name]" );
		$smarty->assign ( 'error_report', "on" );
		$smarty->assign ( 'error_message', "Dear $user_name, you don't have permission to VIEW REPORTS." );
		$smarty->assign ( 'page', "Access Error" );
		$smarty->display ( 'user_home/access_error.tpl' );
	}
} else {
	$smarty->assign ( 'page', "Home" );
	$smarty->display ( 'index.tpl' );
}