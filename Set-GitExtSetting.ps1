function Set-GitExtSetting
{
	<#
	.Synopsis
		Set-GitExtSetting
	.Example
		PS> Set-GitExtSetting
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[hashtable] $Settings,

		[Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
		[alias('FullName')]
		[string] $Path = "$($env:appdata)\GitExtensions\GitExtensions\GitExtensions.settings"
		)

	[xml] $doc = Get-Content $Path -Raw
	$doc.dictionary.item | % {
		$t = $Settings[$_.key.string]
		if ($t) {
			$_.value.SelectSingleNode('string').innerText = $t
		} else {
            Write-Warning "Unable to find setting '$($_.key.string)' to update"
        }
	}

	$doc.Save($Path)
}
