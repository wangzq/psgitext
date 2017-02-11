function Get-GitExtSetting
{
	<#
	.Synopsis
		Get-GitExtSetting
	.Example
		PS> Get-GitExtSetting 
	#>
	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
		[alias('FullName')]
		[string] $Path = "$($env:appdata)\GitExtensions\GitExtensions\GitExtensions.settings"
		)
	
	[xml] $doc = Get-Content $Path -Raw
	$result = @{}
	$doc.dictionary.item | % { 
		$result[$_.key.string] = $_.value.string
	}
	$result
}
