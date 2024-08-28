<?php include('includes/header.php')?>
<?php include('../includes/session.php')?>

<?php 

if(isset($_POST['apply'])) {
    $leaveType = $_POST['leave_type'];
    $leaveDays = $_POST['leave_days'];
    $dateTo = $_POST['date_to'];
    $dateFrom = $_POST['date_from'];
    $description = $_POST['description'];
    $status = 0;
    $isRead = 0;
    $empId = $session_id;
    $postingDate = date('Y-m-d');

    // Insert data into tblleaves
    $insertQuery = "INSERT INTO tblleaves (LeaveType, num_days, ToDate, FromDate, Description, Status, IsRead, empid, PostingDate) 
                VALUES ('$leaveType', $leaveDays, ' $dateTo', '$dateFrom', '$description', $status, $isRead, '$empId', '$postingDate')";

    mysqli_query($conn, $insertQuery) or die(mysqli_error());
    $updateQuery = "UPDATE tblemployees SET Av_leave = Av_leave - $leaveDays WHERE emp_id = '$empId'";
    mysqli_query($conn, $updateQuery) or die(mysqli_error());
	
}
?>



<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo"><img src="../vendors/images/LOGO.png" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				Loading...
			</div>
		</div>
	</div>

	<?php include('includes/navbar.php')?>

	<?php include('includes/right_sidebar.php')?>

	<?php include('includes/left_sidebar.php')?>

	<div class="mobile-menu-overlay"></div>

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pb-20">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>Leave Application</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Apply for Leave</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<div style="margin-left: 50px; margin-right: 50px;" class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Staff Form</h4>
							<p class="mb-20"></p>
						</div>
					</div>
					<div class="wizard-content">
						<form method="post" action="">
							<section>

								<?php if ($role_id = 'Staff'): ?>
								<?php $query= mysqli_query($conn,"select * from tblemployees where emp_id = '$session_id'")or die(mysqli_error());
									$row = mysqli_fetch_array($query);
								?>
						
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label >First Name </label>
											<input name="firstname" type="text" class="form-control wizard-required" required="true" readonly autocomplete="off" value="<?php echo $row['FirstName']; ?>">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label >Last Name </label>
											<input name="lastname" type="text" class="form-control" readonly required="true" autocomplete="off" value="<?php echo $row['LastName']; ?>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Email Adress</label>
											<input name="email" type="text" class="form-control" required="true" autocomplete="off" readonly value="<?php echo $row['EmailId']; ?>">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Available Leave Days </label>
											<input name="Aleave_days" type="text" class="form-control" required="true" autocomplete="off" readonly value="<?php echo $row['Av_leave']; ?>">
										</div>
									</div>
									<?php endif ?>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="form-group">
											<label>Leave Type :</label>
											<select name="leave_type" class="custom-select form-control" required="true" autocomplete="off">
											<option value="">Select leave type...</option>
											<?php $sql = "SELECT  LeaveType from tblleavetype";
											$query = $dbh -> prepare($sql);
											$query->execute();
											$results=$query->fetchAll(PDO::FETCH_OBJ);
											$cnt=1;
											if($query->rowCount() > 0)
											{
											foreach($results as $result)
											{   ?>                                            
											<option value="<?php echo htmlentities($result->LeaveType);?>"><?php echo htmlentities($result->LeaveType);?></option>
											<?php }} ?>
											</select>
										</div>
									</div>

									
								</div>
								<div class="row">
								
            <div class="col-md-6 col-sm-12">
                <div class="form-group">
                    <label>Start Leave Date:</label>
                    <input name="date_from" id="date_from" type="date" class="form-control" required="true" autocomplete="off" min="<?= date('Y-m-d'); ?>">
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="form-group">
                    <label>End Leave Date:</label>
                    <input name="date_to" id="date_to" type="date" class="form-control" required="true" autocomplete="off" min="<?= date('Y-m-d'); ?>">
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="form-group">
                    <label>Leave Days request:</label>
                    <input id="leave_days_input" name="leave_days" type="number" class="form-control" required="true" autocomplete="off" min="1" readonly>
                </div>
            </div>
        			
								</div>

								<div class="row">
									<div class="col-md-8 col-sm-12">
										<div class="form-group">
											<label>Reason For Leave :</label>
											<textarea id="textarea1" name="description" class="form-control" required length="150" maxlength="150" required="true" autocomplete="off"></textarea>
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label style="font-size:16px;"><b></b></label>
											<div class="modal-footer justify-content-center">
												<button class="btn btn-primary" name="apply" id="apply" data-toggle="modal">Apply&nbsp;Leave</button>
											</div>
										</div>
									</div>
								</div>
							</section>
						</form>
					</div>
				</div>

			</div>
			<?php include('includes/footer.php'); ?>
		</div>
	</div>
	<?php include('includes/scripts.php')?>
</body>
</html>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        function getBusinessDaysCount(startDate, endDate) {
            var count = -2; 
            var currentDate = new Date(startDate);
            while (currentDate <= endDate) {
                if (currentDate.getDay() !== 0 && currentDate.getDay() !== 6) {
                    count++;
                }
                currentDate.setDate(currentDate.getDate() + 1);
            }
            return count;
        }
        function updateLeaveDays() {
            var startDate = new Date(document.getElementById("date_from").value);
            var endDate = new Date(document.getElementById("date_to").value);
            document.getElementById("date_from").min = new Date().toISOString().split("T")[0]; 
            document.getElementById("date_to").min = new Date().toISOString().split("T")[0]; 
            document.getElementById("date_from").max = new Date("9999-12-31").toISOString().split("T")[0]; 
            document.getElementById("date_to").max = new Date("9999-12-31").toISOString().split("T")[0]; 

            document.getElementById("date_to").min = document.getElementById("date_from").value;
            var leaveDays = getBusinessDaysCount(startDate, endDate);
            document.getElementById("leave_days_input").value = leaveDays;
        }
        document.getElementById("date_from").addEventListener("change", updateLeaveDays);
        document.getElementById("date_to").addEventListener("change", updateLeaveDays);

        var dateInputs = document.querySelectorAll("input[type='date']");
        dateInputs.forEach(function(input) {
            input.addEventListener("input", function() {
                var selectedDate = new Date(this.value);
                if (selectedDate.getDay() === 0 || selectedDate.getDay() === 6) {
                    this.value = ""; 
                    alert("Please select a weekday."); 
                }
            });
        });
    });
</script>




