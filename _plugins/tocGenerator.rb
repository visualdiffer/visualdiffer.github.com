    require 'nokogiri'

    module Jekyll
      module TOCGenerator
        TOGGLE_HTML = '<div id="toctitle"><h2>%1</h2>%2</div>'
        TOC_CONTAINER_HTML = '<div id="toc-container"><table class="toc" id="toc"><tbody><tr><td>%1<ul>%2</ul></td></tr></tbody></table></div>'
        HIDE_HTML = '<span class="toctoggle">[<a id="toctogglelink" class="internal" href="#">%1</a>]</span>'

       def toc_generate(html)
            pageContext = @context.environments.first["page"]

            anchorPrefix = pageContext["anchorPrefix"] || 'tocAnchor-'
            showAlways = pageContext["showAlways"] || false
            saveShowStatus = pageContext["saveShowStatus"] || true

            # Text labels
            contentsLabel = pageContext["contentsLabel"] || 'Contents'
            hideLabel = pageContext["hideLabel"] || 'hide'
            showText = pageContext["showText"] || 'show'
            showHideButton = pageContext["showHideButton"] || true;

            noToc = pageContext["noToc"] || false;

            if noToc 
                return html
            end

            tocHTML = ''
            tocLevel = 1
            tocSection = 1
            itemNumber = 1
    	    levelHTML = ''

    		doc = Nokogiri::HTML(html)

    		# Find H1 tag and all its H2 siblings until next H1
    		# TODO This XPATH expression can greatly improved
    		doc.css('h1').each do |h1|
    			  ct  = h1.xpath('count(following-sibling::h1)')
    			  h2s = h1.xpath("following-sibling::h2[count(following-sibling::h1)=#{ct}]")

    			levelHTML = '';
    			innerSection = 0;

    			h2s.map.each do |h2|
                    innerSection += 1;
                    anchorId = anchorPrefix + tocLevel.to_s + '-' + tocSection.to_s + '-' + innerSection.to_s
                    # Insert before element the anchor used by TOC
                    h2.before("<a name=\"#{anchorId}\"></a>")

                    levelHTML += createLevelHTML(anchorId,
                        tocLevel + 1,
                        tocSection + innerSection,
                        itemNumber.to_s + '.' + innerSection.to_s,
                        h2.text,
                        '')
    			end
                if levelHTML.length > 0
                    levelHTML = '<ul>' + levelHTML + '</ul>';
                end
                anchorId = anchorPrefix + tocLevel.to_s + '-' + tocSection.to_s;
                # Insert before element the anchor used by TOC
                h1.before("<a name=\"#{anchorId}\"></a>")

                tocHTML += createLevelHTML(anchorId,
                    tocLevel,
                    tocSection,
                    itemNumber,
                    h1.text,
                    levelHTML);

                tocSection += 1 + innerSection;
                itemNumber += 1;
    		end

            if tocHTML.length > 0
                hideHTML = '';
                if (showHideButton)
                    hideHTML = HIDE_HTML.gsub('%1', hideLabel)
                end

                hasOnlyOneTocItem = tocLevel == 1 && tocSection <= 2;
                show = showAlways ? true : !hasOnlyOneTocItem;

                if (show)
                    replacedToggleHTML = TOGGLE_HTML
                        .gsub('%1', contentsLabel)
                        .gsub('%2', hideHTML);
                    tocTable = TOC_CONTAINER_HTML
                        .gsub('%1', replacedToggleHTML)
                        .gsub('%2', tocHTML);
                    doc.css('body').children.before(tocTable)
                end
                doc.css('body').children.to_xhtml(indent:3, indent_text:" ")
            else
                return html
            end
       end

    private
      
        def createLevelHTML(anchorId, tocLevel, tocSection, tocNumber, tocText, tocInner)
            link = '<a href="#%1"><span class="tocnumber">%2</span> <span class="toctext">%3</span></a>%4'
                .gsub('%1', anchorId.to_s)
                .gsub('%2', tocNumber.to_s)
                .gsub('%3', tocText)
                .gsub('%4', tocInner ? tocInner : '');
            '<li class="toclevel-%1 tocsection-%2">%3</li>'
                .gsub('%1', tocLevel.to_s)
                .gsub('%2', tocSection.to_s)
                .gsub('%3', link)
        end
      end
    end

    Liquid::Template.register_filter(Jekyll::TOCGenerator)