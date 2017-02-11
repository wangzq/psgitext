function Get-GitExtOwnScripts
{
	<#
	.Synopsis
		Get-GitExtOwnScripts
	.Example
		PS> Get-GitExtOwnScripts 
	#>
	[CmdletBinding()]
	param (
		[Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
		[alias('FullName')]
		[string] $Path = "$($env:appdata)\GitExtensions\GitExtensions\GitExtensions.settings"
		)
	
	process {
		$x = Get-GitExtSetting -Path $Path
		[xml] $doc = $x.ownScripts
		$doc.ArrayOfScriptInfo.ScriptInfo
	}
}
