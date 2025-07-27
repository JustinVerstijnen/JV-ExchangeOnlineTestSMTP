# System-Parameters
Write-Host -ForegroundColor Yellow "Fill in the sending account"
$credentials = Get-Credential
$subject = "Mail succesfully sent!"
$body = "This email is succesfully sent through SMTP with PowerShell"
$smtpserver = 'smtp.office365.com'
$amount = 1 # How many messages you want to send

# Enable TLS 1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

# To
$to = Read-Host "Please fill in the address to receive this testing email(s)..."

# Sending, de 
for ($i = 0; $i -lt $amount; $i++) {
    Send-MailMessage -From $credentials.UserName -To $to -Subject $subject -Body $body -SmtpServer $smtpserver -Credential $credentials -UseSsl -Port 587 -Verbose
}

Write-Host -ForegroundColor Green "The message are succesfully tried to send. Please check your inbox."
