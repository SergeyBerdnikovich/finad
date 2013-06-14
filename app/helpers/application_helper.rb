module ApplicationHelper
	def to_rating(rating)
		case rating
			when 0
				return "F"
			when 1
				return "E"
			when 2
				return "D"
			when 3
				return "C"
			when 4
				return "B"
			when 5
				return "A"
		end
		return "No rating available"
	end

	def get_states()
		@state = [['Alabama', 'AL'],
                        ['Alaska', 'AK'],
                        ['Alberta', 'AB'],
                        ['American Somoa', 'AS'],
                        ['Arizona', 'AZ'],
                        ['Arkansas', 'AR'],
                        ['British Columbia', 'BC'],
                        ['California', 'CA'],
                        ['Caroline Islands', 'FM'],
                        ['Colorado', 'CO'],
                        ['Connecticut', 'CT'],
                        ['Delaware', 'DE'],
                        ['District of Columbia', 'DC'],
                        ['Florida', 'FL'],
                        ['Georgia', 'GA'],
                        ['Guam', 'GU'],
                        ['Hawaii', 'HI'],
                        ['Idaho', 'ID'],
                        ['Illinois', 'IL'],
                        ['Indiana', 'IN'],
                        ['Iowa', 'IA'],
                        ['Indiana', 'IN'],
                        ['Kansas', 'KS'],
                        ['Kentucky', 'KY'],
                        ['Louisiana', 'LA'],
                        ['Maine', 'ME'],
                        ['Manitoba', 'MB'],
                        ['Mariana Islands', 'MP'],
                        ['Marshall Islands', 'MH'],
                        ['Maryland', 'MD'],
                        ['Massachusetts', 'MA'],
                        ['Michigan', 'MI'],
                        ['Minnesota', 'MN'],
                        ['Mississippi', 'MS'],
                        ['Missouri', 'MO'],
                        ['Montana', 'MT'],
                        ['Nebraska', 'NE'],
                        ['Nevada', 'NV'],
                        ['New Brunswick', 'NB'],
                        ['New Foundland', 'NF'],
                        ['New Hampshire', 'NH'],
                        ['New Jersey', 'NJ'],
                        ['New Mexico', 'NM'],
                        ['New York', 'NY'],
                        ['North Carolina', 'NC'],
                        ['North Dakota', 'ND'],
                        ['NorthWest Territories', 'NT'],
                        ['Nova Scotia', 'NS'],
                        ['Ohio', 'OH'],
                        ['Oklahoma', 'OK'],
                        ['Ontario', 'ON'],
                        ['Oregon', 'OR'],
                        ['Pennsylvania', 'PA'],
                        ['Prince Edward Island', 'PE'],
                        ['Puerto Rico', 'PR'],
                        ['Quebec', 'QC'],
                        ['Rhode Island', 'RI'],
                        ['Saskatchewan', 'SK'],
                        ['South Carolina', 'SC'],
                        ['South Dakota', 'SD'],
                        ['Tennessee', 'TN'],
                        ['Texas', 'TX'],
                        ['Utah', 'UT'],
                        ['Vermont', 'VT'],
                        ['Virgin Islands', 'VI'],
                        ['Virginia', 'VA'],
                        ['Washington', 'WA'],
                        ['West Virginia', 'WV'],
                        ['Wisconsin', 'WI'],
                        ['Wyoming', 'WY'],
                        ['Yukon Territory', 'YT']]
         return @state
	end
      def url_with_protocol(url)
        /^http/.match(url) ? url : "http://#{url}"
      end

  def add_child_button(name, association)
    link_to(name, "javascript:void(0);", :class => "add_child button", :"data-association" => association)
  end

  def remove_child_link(name, f)
    f.hidden_field(:_destroy) + link_to(name, "javascript:void(0)", :class => "remove_child")
  end

  def add_child_link(name, association)
    link_to(name, "javascript:void(0);", :class => "add_child", :"data-association" => association)
  end

  def new_child_fields_template(form_builder, association, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize
    options[:locals] ||= {}
    options[:form_builder_local] ||= :f

    content_tag(:div, :id => "#{association}_fields_template", :style => "display: none") do
      form_builder.fields_for(association, options[:object], :child_index => "new_#{association}") do |f|
        raw( render(:partial => options[:partial], :locals => {options[:form_builder_local] => f }.merge(options[:locals])) )
      end
    end
  end

  def visitors_counter
    "<table style='margin-left:45%;margin-top:80px'>
      <tr>
        <td>
          <label for='ccounter'>Visitors counter:</label>
        </td>
        <td>
          <iframe id='ccounter' class='inputbox'  scrolling='no' style='width:148px;height:25px' src='http://search.investmentprotectionbureau.org/counters'></iframe>
        </td>
      </tr>
    </table>"
  end
end
