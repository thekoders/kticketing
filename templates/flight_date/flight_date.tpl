{include file="header.tpl"}
{include file="navigation.tpl"}


<div class="row">
	<div class="panel panel-info" style="margin-top: 10px;">
		<div class="panel-heading">
			<strong>Flight Date Report</strong>
		</div>
		<div class="panel-body">
			<form role="form" action="flight_date.php?job=search" method="post">
				<div class="col-lg-3">
					<div class="form-group" style="visibility:visible;">
						<div class="controls input-append date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
							<input type="text" class="form-control" name="date" value="{$date}" id="datepicker" placeholder="Date" style="width: 100%;">
							<span class="add-on"><i class="icon-remove"></i></span>
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
						<input type="hidden" id="dtp_input1" value="" />
					</div>
				</div>
				<div class="col-lg-2">
					<button type="submit" name="ok" value="Search" class="btn btn-primary">Search</button>
				</div>
			</form>
		</div>
	</div>
</div>

{if $search=="on"}
	<div class="row">
		<div class="panel panel-info" style="margin-top: 10px;">
			<div class="panel-heading">
				<strong>Departure Date</strong>
			</div>
			<div class="panel-body">
                {php} customer_dep_date($_SESSION['date']);{/php}
			</div>

			<div class="panel-footer">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="panel panel-info" style="margin-top: 10px;">
			<div class="panel-heading">
				<strong>Arrival Date</strong>
			</div>
			<div class="panel-body">
                {php} customer_arr_date($_SESSION['date']);{/php}
			</div>

			<div class="panel-footer">
			</div>
		</div>
	</div>

{/if}

{include file="footer.tpl"}

{literal}
	<script>
        $(function () {
            $("#example1").DataTable();
        });
	</script>
	<script>
        $(function () {
            $("#example2").DataTable();
        });
	</script>
	<script>
	  $(function () {

	    $('#datepicker').datepicker({
	     format: 'yyyy-mm-dd',
	      autoclose: true
	    });
	 });
	</script>
{/literal}