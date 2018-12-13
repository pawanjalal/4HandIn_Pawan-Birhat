<!-- Example: Transforming XML to XML-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:c="http://my.company.com">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="c:commercials">
    <Advertisements>
      <xsl:apply-templates select="c:commercial"/>
    </Advertisements>
  </xsl:template>

  <xsl:template match="c:commercial">
    <Ad>
      <NavigateUrl>
        <xsl:value-of select="c:webpage"/>
      </NavigateUrl>
      <Impressions>
        <xsl:value-of select="c:telephone"/>
      </Impressions>
      <ImageUrl>
        <xsl:value-of select="c:logo"/>
        <xsl:value-of select="c:Ourlogo"/>
      </ImageUrl>
      <MyView>
        <xsl:value-of select="view"/>
      </MyView>
      <AlternateText>
        <xsl:value-of select="@company"/>
      </AlternateText>
    </Ad>
  </xsl:template>

</xsl:stylesheet>
