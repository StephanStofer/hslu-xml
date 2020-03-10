<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xml>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:param name="eventId" select="default"/>
	<xsl:param name="pdfPath" select="default"/>
	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
	<xsl:include href="page.xsl" />
	<xsl:template match="events">
		<xsl:apply-templates select="event[@id=$eventId]" />
	</xsl:template>
	<xsl:template match="event">
		<div class="card mb-4 shadow-sm text-center">
			<div class="card-header">
				<h2 class="my-0 font-weight-normal">
					<xsl:value-of select="name"/>
				</h2>
			</div>
			<div class="card-body">
				<div class="mt-4 shadow">
					<img class="border rounded w-100 p-3">
						<xsl:attribute name="src">
							<xsl:value-of select="settings/image/@path"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="settings/image/@alt"/>
						</xsl:attribute>
					</img>
				</div>
				</div>
				<div class="card-body shadow p-3 mb-5 mx-3 bg-white rounded">
				<p class="text-left">
					<xsl:value-of select="description"/>
				</p>
			</div>
			<div class="shadow p-3 mb-5 mx-3 bg-white rounded"> 
				<!-- falls maxteilnehmer gesetzt ist wird geschaut ob noch Platz vorhanden ist-->
				<xsl:choose>
					<xsl:when test="//event[@id=$eventId]/@maxparticipants">
						<xsl:choose>
							<xsl:when test="count(//event[@id=$eventId]/participants/person) &lt; round(//event[@id=$eventId]/@maxparticipants)">
								<xsl:call-template name="form"/>
							</xsl:when>
							<xsl:otherwise>
								<h3>Leider ist der Kurs bereits ausgebucht</h3><br/>
								<a href="forum.php?eventId={$eventId}" class="btn btn-outline-primary">Forum</a>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="form"/>
					</xsl:otherwise>
				</xsl:choose>
			</div>			
		</div>
	</xsl:template>
	<xsl:template name="form">
		<form action="frontend/php/insert.php" method="POST" accept-charset="UTF-8" class="needs-validation container">
			<input type="hidden" name="eventId" value="{$eventId}"/>
			<div class="form-row" >
				<div class="form-group col-md-6">
					<input type="text" class="form-control" id="firstName" name="firstName" placeholder="Vorname" required="true"/>
				</div>
				<div class="form-group col-md-6">
					<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Nachname" required="true"/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<input type="text" class="form-control" id="address" name="address" placeholder="Strasse" required="true"/>
				</div>
				<div class="form-group col-md-4">
					<input type="text" class="form-control" id="city" name="city" placeholder="Ort" required="true"/>
				</div>
				<div class="form-group col-md-2">
					<input type="text" class="form-control" id="postCode" name="postCode" placeholder="PLZ" required="true"/>
				</div>
			</div>
			<div class="form-row" >
				<div class="form-group col-md-6">
					<input type="email" class="form-control" id="email" name="email" placeholder="E-Mail" required="true"/>
				</div>
				<div class="form-group col-md-6">
					<input type="tel" class="form-control" id="phone" name="phone" placeholder="Telefon" required="true"/>
				</div>
			</div>
			<div class="container">Optionen:</div>
			<div class="form-group">
				<xsl:for-each select="additionalServices/service">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="op{@id}" value="selected"/>
						<label for="service_{@id}">
							<xsl:value-of select="@title"/>: Kosten <xsl:value-of select="@price"/>.-
						</label>
					</div>
				</xsl:for-each>
			</div>
			<button type="submit" name ="send" value="submit" class="btn btn-primary" >Anmelden</button>
			<a href="forum.php?eventId={$eventId}" class="btn btn-outline-primary">Forum</a>
		</form>
	</xsl:template>
</xsl:stylesheet>