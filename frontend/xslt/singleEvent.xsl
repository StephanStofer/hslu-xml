<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xml>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:param name="eventid" select="default"/>
	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
	<xsl:template match="/">

		<html lang="en">
			<head>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
				<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
				<title>Events</title>
			</head>
			<body>
				<div class="container">
					<div class="card-deck mb-3">
						<xsl:apply-templates select="/events/event[@id=$eventid]"/>
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"/>
				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"/>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="event">
		<div class="card mb-4 shadow-sm text-center">
			<div class="card-header">
				<h2 class="my-0 font-weight-normal">
					<xsl:value-of select="name"/>
				</h2>
			</div>
			<div class="card-body">
				<img style="float:left;border: 1px solid #ddd; border-radius: 4px;
  padding: 5px;  max-width: 42%;  height: auto;margin-right:20px">
					<xsl:attribute name="src">
						<xsl:value-of select="settings/image/@path"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="settings/image/@alt"/>
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:text>card-img-top</xsl:text>
					</xsl:attribute>
				</img>
				<p align="left">
					<xsl:value-of select="description"/>
				</p>
				<ul class="list-unstyled mt-3 mb-4">
					<li>
						<xsl:value-of select="name"/>
					</li>
				</ul>
				<button type="button" class="btn btn-primary" alt="Anmeldung" style="margin-right: 4px;">Anmeldung</button>
				<button type="button" class="btn btn-primary" alt="Forum">Forum</button>
				
				<xsl:value-of select="$eventid"/>
				
				
			</div><form action="frontend/php/insert.php" method="POST" accept-charset="UTF-8">
			<input type="hidden" name="eventid" value="{$eventid}"/>
			
			<label for="f_name">First Name:</label>
			<input type="text" id="f_name" name="f_name"/><br/>
			<label for="l_name">Last Name:</label>
			<input type="text" id="l_name" name="l_name"/><br/><br/>
			Optionen:<br/>
			<xsl:for-each select="additionalServices/service">
				<input type="checkbox" name="{@id}" value="1"/>
				<label for="{@id}"><xsl:value-of select="@title"/>: Kosten <xsl:value-of select="@price"/>.-</label><br/>
			</xsl:for-each>
			<input type="submit" name ="test" value="submit"/>
		</form>
		</div>
		
	</xsl:template>
</xsl:stylesheet>























