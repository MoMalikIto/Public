#######################
## Log to file       ##
## 16:11 19/09/2023  ##
#######################

# Set base folder to work with
# Log File path and name
$base_folder = 'c:\test'
$log_file_name = "log_file.txt"
#
$log_file_path = $base_folder
$log_file = $log_file_path + "\" + $log_file_name

# Change into base folder
cd $base_folder

# log to file function
function log-it {
	param ([String]$input_string)
	#write-host $input_string
	$date = (Get-Date -Format "yyyyMMddTHH:mm:ss")
	$string = $date + " - " + $input_string #
    Add-Content -path $log_file -value $string
	#
}

# Check if log file exists
if (!(Test-Path $log_file))
{
    New-Item -path $log_file_path -name $log_file_name -type "file" | Out-Null
	log-it ("--------------------")
	log-it ("New Log file created")
}

#
log-it ("--------------")
log-it ("Script started")
# do something
log-it ("Script complete")
