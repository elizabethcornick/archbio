<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
        
    <!--  <xsl:strip-space elements="*"/>-->
    <xsl:preserve-space elements="*"/>
    
    <xsl:output method="html"/>

    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:back"/>
    <xsl:template match="tei:reg | tei:sic"/>


    <xsl:template match="tei:text">
        <div id="general">
            <xsl:apply-templates/>
        </div>
        <!-- Div final con metadatos: -->
        <div id="texto_fuente">
            <hr class="my-6"/>
        </div>

        <div id="fuente">
            <span><b>Print Source: </b>
                <xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'print']/tei:author"
                />, <i><xsl:value-of
                        select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'print']/tei:title"
                    /></i>, ed. <xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'print']/tei:editor"
                    />, <xsl:value-of
                        select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'print']/tei:pubPlace"
                    />: <xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'print']/tei:publisher"
                />, <xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'print']/tei:date"
                />
            </span>
            <br/>
            <span>
                <b>Online Source: </b>
                <xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'digital']/tei:publisher"
                /> (<xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'digital']/tei:date"
                />), <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of
                            select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'digital']/tei:ref"
                        />
                    </xsl:attribute>
                    <xsl:value-of
                        select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl[@type = 'digital']/tei:ref"
                    />
                </xsl:element>
            </span>
            <br/>
            <span>
                <b>Encoded by: </b>
                <xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName"
                > </xsl:value-of> (<xsl:value-of
                    select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>)</span>
        </div>
    </xsl:template>





    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="tei:persName">
        <span class="persName" title="persName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

<!--    <xsl:template match="tei:roleName">
        <span class="roleName" title="roleName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>-->

    <xsl:template match="tei:name">
        <span class="name">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:title | tei:foreign">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>



    <xsl:template match="tei:placeName">
        <span class="placeName" title="placeName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:orig"/>
        <xsl:if test="following-sibling::tei:choice">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:reg"/>
    
    <xsl:template match="tei:q">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template match="tei:note"/>
    <!-- <xsl:template match="tei:note">
        <div class="notes">

            <xsl:if test="contains(@resp, '#DBordona')">
                    <xsl:element name="a">
                        <xsl:attribute name="name">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:value-of select="@target"/>
                        </xsl:attribute>
                        <xsl:attribute name="title">Nota Dominguez Bordona</xsl:attribute>
                        <sup>*</sup>
                    </xsl:element>

                </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>-->

    <xsl:template match="tei:ref"/>
    <!--<xsl:template match="tei:ref">
            <xsl:if test="contains(@type, 'n_DBordona')">
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">Nota Dominguez Bordona</xsl:attribute>
                    <!-\-<xsl:apply-templates/>-\->
                    <sup>*</sup>
                </xsl:element>
            </xsl:if>
    </xsl:template>-->

</xsl:stylesheet>
