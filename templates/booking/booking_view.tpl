{include file="header.tpl"}
{include file="navigation.tpl"}
{literal}
<script type="text/javascript">
$(document).ready(function() {
$('input.passport_no').typeahead({
  name: 'passport_no',
  remote : 'ajax/passport_no.php?query=%QUERY'

});
})
</script>
{/literal}
<section class="content">
	<div class="row">
		<div class="col-lg-12" style="margin-top: 10px;">
			<div class="panel panel-info" style="margin-top: 10px;">
                <div class="panel-heading">
                    <form role="form" action="booking.php?job=search" method="post" name="add_item">
						<div class="form-group">
            				<input type="text" name="search" value="{$booking_no}" placeholder="Search By Booking No" class="form-control"/>
		            	</div>
                   </form>
                </div>
                
            </div>
	    </div>
   </div>
	<div class="row">
		<div class="col-lg-12" style="margin-top: 10px;">
			<div class="panel panel-info" style="margin-top: 10px;">
                <div class="panel-heading">
                    <strong>Booking Details</strong>
                </div>
                <div class="panel-body">
            		{php}display_booking_detail_just_view($_SESSION['booking_no'], $_SESSION['id']);{/php}
				
					{php}list_passengers_details_just_view($_SESSION['booking_no']);{/php}
				
            		{php}display_booking_cost($_SESSION['booking_no'], $_SESSION['id']);{/php}
				</div>
            </div>
	    </div>
   </div>
</section>
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
            $("#example3").DataTable();
        });
    </script>
{/literal}