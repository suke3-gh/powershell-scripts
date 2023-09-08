
Param($inputFormat, $outputFormat)

# Checked either specified format or not.
if ($null -eq $inputFormat) {
    Write-Host 'Notice : There is not first parameter. Please enter the file extension want to convert.'
    Write-Host 'Notice : Stop a script...'
    exit
}

if ($null -eq $outputFormat) {
    Write-Host 'Notice : There is not second parameter. This time, image is converted as jpg.'
}

switch ($format) {
    avif {
        break
    }
	png {
		break
	}
	webp{
		break
	}
	Default {
        break
    }
}
