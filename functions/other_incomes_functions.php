<?php
function list_incomes_by_other_incomes_no($other_incomes_no) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$result = mysqli_query ($conn, "SELECT * FROM other_incomes_has_incomes WHERE other_incomes_no='$other_incomes_no' AND cancel_status='0' ORDER BY id ASC" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		echo "<tr>
		<td>$row[incomes_name]</td>
		<td>$row[detail]</td>
		<td align='right'>$row[amount]</td>" . '
		<td ><a href="other_incomes.php?job=delete_expense&id=' . $row [id] . '" ><img src="images/close.png" alt="Delete" /></a></td>
		</tr>';
	}
	
	
}
function check_non_saved_other_incomes($user_name) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$result = mysqli_query ($conn, "SELECT count(id) FROM other_incomes_has_incomes WHERE user_name='$user_name' AND saved='0'" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		if ($row ['count(id)'] >= 1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	
}
function non_save_other_incomes_info($user_name) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$result = mysqli_query ($conn, "SELECT MIN(other_incomes_no) FROM other_incomes_has_incomes WHERE user_name='$user_name' AND saved='0'" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		return $row ['MIN(other_incomes_no)'];
	}
	
	
}
function get_other_incomes_no() {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$result = mysqli_query ($conn, "SELECT MAX(other_incomes_no) FROM other_incomes_has_incomes" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		return $row ['MAX(other_incomes_no)'] + 1;
	}
	
	
}
function save_expense($incomes_name, $detail, $amount, $other_incomes_no, $user_name) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$date = date ( "Y-m-d" );
	$total = $quantity * $buying_price;
	mysqli_select_db ($conn, $dbname );
	$query = "INSERT INTO other_incomes_has_incomes (id, incomes_name, detail, amount, other_incomes_no, user_name)
	VALUES ('', '$incomes_name', '$detail', '$amount', '$other_incomes_no', '$user_name')";
	mysqli_query ($conn, $query ) or die ( mysqli_error () );
	
	
}
function delete_expense($id) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	mysqli_select_db ($conn, $dbname );
	$query = "UPDATE other_incomes_has_incomes SET
	cancel_status='1',
	canceled_by='$_SESSION[user_name]'
	WHERE id='$id'";
	mysqli_query ($conn, $query );
	
	
}
function update_incomes_saved($other_incomes_no) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	mysqli_select_db ($conn, $dbname );
	$query = "UPDATE other_incomes_has_incomes SET
	saved='1'
	WHERE other_incomes_no='$other_incomes_no'";
	mysqli_query ($conn, $query );
	
	
}
function get_incomes_total($other_incomes_no) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$result = mysqli_query ($conn, "SELECT sum(amount) as total FROM other_incomes_has_incomes WHERE other_incomes_no='$other_incomes_no' AND cancel_status='0'" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		$total = $row [total];
	}
	
	return $total;
	
	
}
function save_other_incomes($other_incomes_no, $date, $customer_name, $prepared_by, $remarks, $total, $cash_amount, $cheque_amount, $cheque_no, $cheque_bank, $cheque_branch, $cheque_date, $temp_name) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	if ($temp_name) {
		$unauthorized = '1';
	}
	
	$date = date ( "Y-m-d", strtotime ( $date ) );
	$cheque_date = date ( "Y-m-d", strtotime ( $cheque_date ) );
	mysqli_select_db ($conn, $dbname );
	$query = "INSERT INTO other_incomes (id, other_incomes_no, customer_name, prepared_by, remarks, date, total, cash_amount, cheque_amount, cheque_no, cheque_bank, cheque_branch, cheque_date, temp_name, unauthorized)
	VALUES ('', '$other_incomes_no', '$customer_name', '$prepared_by', '$remarks', '$date', '$total', '$cash_amount', '$cheque_amount', '$cheque_no', '$cheque_bank', '$cheque_branch', '$cheque_date', '$temp_name', '$unauthorized')";
	mysqli_query ($conn, $query ) or die ( mysqli_error () );
	
	
}
function list_other_incomes_search($other_incomes_no_search, $customer_search) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	if ($other_incomes_no_search && $customer_search) {
		$and = "AND ";
	} else {
		$and = "";
	}
	
	if ($other_incomes_no_search) {
		$other_incomes_no_check = "other_incomes_no LIKE '%$other_incomes_no_search'";
	} else {
		$other_incomes_no_check = "";
	}
	
	if ($customer_search) {
		$suppier_check = "customer_name='$customer_search'";
	} else {
		$suppier_check = "";
	}
	
	if ($other_incomes_no_search || $customer_search) {
		
		echo '<table  style="width: 100%;" class="table-responsive table-bordered table-striped dt-responsive">
	<thead valign="top">
	<th>Print</th>
	<th>Other incomes  No</th>
	<th>Other incomes  Date</th>
	<th>Suppier Name</th>
	<th>Cash Amount</th>
	<th>Cheque Amount</th>
	<th>Payment Total</th>
	<th>Remarks</th>
	<th>Prepared By</th>
	<th>Delete</th>
	</thead>
	<tbody valign="top">';
		
		$result = mysqli_query ($conn, "SELECT * FROM other_incomes WHERE $suppier_check $and $other_incomes_no_check AND cancel_status='0' ORDER BY id DESC" );
		while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
			echo '
		<tr>
			<td><a href="other_incomes.php?job=print_preview&id=' . $row [id] . '"  ><img src="images/print.png" alt="Print" width="24" height="24" /></a></td>
			
			<td align="center">' . $row [other_incomes_no] . '</td>
					
			<td>' . $row [date] . '</td>
					
			<td>' . $row [customer_name] . '</td>
			
			<td align="right">' . $row [cash_amount] . '</td>
			
			<td align="right">' . $row [cheque_amount] . '</td>
			
			<td align="right">' . $row [total] . '</td>
		
			<td>' . $row [remarks] . '</td>
			
			<td>' . strtoupper ( $row [prepared_by] ) . '</td>
		
			<td><a href="#" onclick="javascript:showConfirm(\'Are you sure you want to delete this entry?\',\'\',\'Yes\',\'other_incomes.php?job=delete&id=' . $row [id] . '\',\'No\',\'other_incomes.php?job=search\')"><img src="images/close.png" alt="Delete" /></a></td>
		</tr>';
		}
		echo '</tbody></table>';
	}
	
	
}
function list_other_incomess() {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	echo '<table  style="width: 100%;" class="table-responsive table-bordered table-striped dt-responsive">
	<thead valign="top">
	<th>Edit</th>
	<th>Print</th>
	<th>Other incomes  No</th>
	<th>Other incomes  Date</th>
	<th>Suppier Name</th>
	<th>Other incomes Total</th>
	<th>Remarks</th>
	<th>Prepared By</th>
	<th>Delete</th>
	</thead>
	<tbody valign="top">';
	
	$result = mysqli_query ($conn, "SELECT * FROM other_incomes WHERE cancel_status='0' ORDER BY id DESC" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		echo '
		<tr>
			<td><a href="other_incomes.php?job=edit&id=' . $row [id] . '"  ><img src="images/edit.png" alt="Edit" /></a></td>

			<td><a href="other_incomes.php?job=print_preview&id=' . $row [id] . '"  ><img src="images/print.png" alt="Print" width="24" height="24" /></a></td>
			
			<td>' . $row [other_incomes_no] . '</td>
					
			<td>' . $row [date] . '</td>
					
			<td>' . $row [customer_name] . '</td>
			
			<td>' . $row [total] . '</td>
		
			<td>' . $row [remarks] . '</td>
			
			<td>' . strtoupper ( $row [prepared_by] ) . '</td>
		
			<td><a href="#" onclick="javascript:showConfirm(\'Are you sure you want to delete this entry?\',\'\',\'Yes\',\'other_incomes.php?job=delete&id=' . $row [id] . '\',\'No\',\'other_incomes.php?job=search\')"><img src="images/close.png" alt="Delete" /></a></td>
		</tr>';
	}
	echo '</tbody></table>';
	
	
}
function get_other_incomes_info($id) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$result = mysqli_query ( $conn, "SELECT * FROM other_incomes WHERE id='$id'" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		return $row;
	}
	
}
function get_other_incomes_info_by_other_incomes_no($other_incomes_no) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$result = mysqli_query ($conn, "SELECT * FROM other_incomes WHERE other_incomes_no='$other_incomes_no'" );
	while ( $row = mysqli_fetch_array ( $result, MYSQLI_ASSOC ) ) {
		return $row;
	}
	
}
function update_other_incomes($id, $other_incomes_no, $date, $customer_name, $prepared_by, $remarks, $total, $updated_by) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	$date = date ( "Y-m-d", strtotime ( $date ) );
	
	mysqli_select_db ($conn, $dbname );
	$query = "UPDATE other_incomes SET
	other_incomes_no='$other_expenses_no',
	date='$date',
	customer_name='$customer_name',
	prepared_by='$prepared_by',
	remarks='$remarks',
	total='$total',
	due='$total',
	updated_by='$updated_by' 
	WHERE id='$id'";
	
	mysqli_query ($conn, $query );
	
	
}
function calncel_incomes_for_other_incomes_no($other_incomes_no) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	mysqli_select_db ($conn, $dbname );
	$query = "UPDATE other_incomes_has_incomes SET
	cancel_status='1',
	canceled_by='$_SESSION[user_name]',
	saved='1'
	WHERE other_incomes_no='$other_incomes_no'";
	mysqli_query ( $conn,$query );
	
	
}
function cancel_other_incomes($id) {
	include 'conf/config.php';
	include 'conf/opendb.php';
	
	mysqli_select_db ($conn, $dbname );
	$query = "UPDATE other_incomes SET
	cancel_status='1',
	canceled_by='$_SESSION[user_name]'
	WHERE id='$id'";
	mysqli_query ($conn, $query );
	
	
}