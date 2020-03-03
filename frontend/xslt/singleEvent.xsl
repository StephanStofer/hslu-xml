<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xml>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:param name="eventid" select="default"/>
	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
	<xsl:include href="page.xsl" />
	<xsl:template match="events">
		<xsl:apply-templates select="event[@id=$eventid]" />
	</xsl:template>
	<xsl:template match="event">
		<div class="card mb-4 shadow-sm text-center">
			<div class="card-header">
				<h2 class="my-0 font-weight-normal">
					<xsl:value-of select="name"/>
				</h2>
			</div>
			<div class="card-body">
				<img style="border: 1px solid #ddd; border-radius: 4px;  padding: 5px;  max-width: 600px;  height: auto ;display: block; margin-left: auto;  margin-right: auto;">
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
			</div>
			<div class="card-body shadow p-3 mb-5 bg-white rounded" style="width:600px;margin:0 auto">
				<p align="left">
					<xsl:value-of select="description"/>
				</p>

				<ul class="list-unstyled mt-3 mb-4">
					<li>
						<xsl:value-of select="name"/>
					</li>
				</ul>
				<a  class="btn btn-outline-primary" href="forum.php?eventid={@id}">Forum</a>
				<br/>
				<br/>

			</div>
			<div style="width:600px;margin:0 auto" class="shadow p-3 mb-5 bg-white rounded"> 

				<!-- xsl if max teilnehmer erreicht -> Meldung anzeigen (Fixtext)
			     xsl if max teilnehmer NICHT erreicht .> Form anzeigen -->

				<form action="frontend/php/insert.php" method="POST" accept-charset="UTF-8" class="needs-validation container">
					<input type="hidden" name="eventid" value="{$eventid}"/>
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
									<xsl:value-of select="@title"/>: Kosten <xsl:value-of select="@price"/>.-</label>
							</div>
						</xsl:for-each>
					</div>
					<button type="submit" name ="send" value="submit" class="btn btn-primary" >Anmelden</button>
					<button type="button" class="btn btn-primary" alt="Forum">Forum</button>
				<br/>
				</form>
			</div>			
		</div>
	</xsl:template>
</xsl:stylesheet>