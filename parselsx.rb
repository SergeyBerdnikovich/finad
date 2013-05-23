require 'roo'
require 'yaml'
require 'mysql2'

$env = 'production'
config = YAML.load_file('config/database.yml')

  sqlconf = {
        :host => "localhost",
        :database => config[$env]['database'],
        :reconnect => true,  # make sure you have correct credentials
        :username => config[$env]['username'],
        :password => config[$env]['password'],
        :size => 30,
        :reconnect => true,
        :connections => 50
      }

$sql = Mysql2::Client.new(sqlconf)



begin
xls = Roo::Spreadsheet.open('6.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[1]) if ar[1] != nil
		address = $sql.escape(ar[5]) if ar[5] != nil
		city = $sql.escape(ar[2]) if ar[2] != nil
		state = $sql.escape(ar[3]) if ar[3] != nil
		zip = $sql.escape(ar[4]) if ar[4] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		
		phone = $sql.escape(ar[6]) if ar[6] != nil
		url = $sql.escape(ar[7]) if ar[7] != nil
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		else
#		p check.to_a
		end
		$sql.query(req)	

	else
		firsline = false
	end
}
rescue Exception => e
	p e
	p e.backtrace
end

begin
xls = Roo::Spreadsheet.open('7.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[1]) if ar[1] != nil
		address = $sql.escape(ar[2]) if ar[2] != nil
		city = $sql.escape(ar[3]) if ar[3] != nil
		state = $sql.escape(ar[4]) if ar[4] != nil
		zip = $sql.escape(ar[5]) if ar[5] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		
		phone = $sql.escape(ar[6]) if ar[6] != nil
		url = $sql.escape(ar[7]) if ar[7] != nil
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		else
#		p check.to_a
		end
		$sql.query(req)	

	else
		firsline = false
	end
}
rescue Exceprion => e
	p e
	p e.backtrace
end

begin
xls = Roo::Spreadsheet.open('8.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[0]) if ar[0] != nil
		address = $sql.escape(ar[1]) if ar[1] != nil
		city = $sql.escape(ar[2]) if ar[2] != nil
		state = $sql.escape(ar[3]) if ar[3] != nil
		zip = $sql.escape(ar[4]) if ar[4] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		
		phone = $sql.escape(ar[5]) if ar[5] != nil
		url = ""
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		else
#		p check.to_a
		end
		$sql.query(req)	

	else
		firsline = false
	end
}
rescue Exceprion => e
	p e
	p e.backtrace
end

begin
xls = Roo::Spreadsheet.open('9.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[0]) if ar[0] != nil
		address = $sql.escape(ar[1]) if ar[1] != nil
		city = $sql.escape(ar[2]) if ar[2] != nil
		state = $sql.escape(ar[3]) if ar[3] != nil
		zip = $sql.escape(ar[4]) if ar[4] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		
		phone = $sql.escape(ar[5]) if ar[5] != nil
		email = $sql.escape(ar[6]) if ar[6] != nil
		url = $sql.escape(ar[7]) if ar[7] != nil
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		$sql.query(req)
		else
#		p check.to_a
		end
	else
		firsline = false
	end
}
rescue Exceprion => e
	p e
	p e.backtrace
end

#exit!  # ######################################################################################## ALREADY SCANNED ##############################################

begin
xls = Roo::Spreadsheet.open('5.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[1]) if ar[1] != nil
		address = $sql.escape(ar[5]) if ar[5] != nil
		city = $sql.escape(ar[2]) if ar[2] != nil
		state = $sql.escape(ar[3]) if ar[3] != nil
		zip = $sql.escape(ar[4]) if ar[4] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		
		phone = $sql.escape(ar[6]) if ar[6] != nil
		url = $sql.escape(ar[7]) if ar[7] != nil
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		else
#		p check.to_a
		end
		$sql.query(req)	

	else
		firsline = false
	end
}
rescue Exceprion => e
	p e
	p e.backtrace
end


begin
xls = Roo::Spreadsheet.open('4.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[1]) if ar[1] != nil
		address = $sql.escape(ar[5]) if ar[5] != nil
		city = $sql.escape(ar[2]) if ar[2] != nil
		state = $sql.escape(ar[3]) if ar[3] != nil
		zip = $sql.escape(ar[4]) if ar[4] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		
		phone = $sql.escape(ar[6]) if ar[6] != nil
		url = $sql.escape(ar[7]) if ar[7] != nil
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		else
#		p check.to_a
		end
		$sql.query(req)	

	else
		firsline = false
	end
}
rescue Exceprion => e
	p e
	p e.backtrace
end


begin
xls = Roo::Spreadsheet.open('1.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[1]) if ar[1] != nil
		address = $sql.escape(ar[2]) if ar[2] != nil
		city = $sql.escape(ar[3]) if ar[3] != nil
		state = $sql.escape(ar[4]) if ar[4] != nil
		zip = $sql.escape(ar[5]) if ar[5] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		phone = $sql.escape(ar[6]) if ar[6] != nil
		if ar[7] != nil
			url = $sql.escape(ar[7])
		else
			url = ""
		end
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		$sql.query(req)
		else
#		p check.to_a
		end
	else
		firsline = false
	end
}
rescue
end

begin
xls = Roo::Spreadsheet.open('2.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[0]) if ar[0] != nil
		address = $sql.escape(ar[1]) if ar[1] != nil
		city = $sql.escape(ar[2]) if ar[2] != nil
		state = $sql.escape(ar[3]) if ar[3] != nil
		zip = $sql.escape(ar[4]) if ar[4] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		phone = $sql.escape(ar[5]) if ar[5] != nil
		url = ""
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		$sql.query(req)
		else
#		p check.to_a
		end
	else
		firsline = false
	end
}
rescue
end

begin
xls = Roo::Spreadsheet.open('3.xlsx')
firsline = true
xls.each{|ar|
	name = ""
	address = ""
	city = ""
	state = ""
	zip = ""
	phone = ""
	if firsline == false
		name = $sql.escape(ar[0]) if ar[0] != nil
		address = $sql.escape(ar[1]) if ar[1] != nil
		city = $sql.escape(ar[2]) if ar[2] != nil
		state = $sql.escape(ar[3]) if ar[3] != nil
		zip = $sql.escape(ar[4]) if ar[4] != nil
		zip = zip.match(/[0-9]{5}/)
		if zip != nil
		zip = zip[0]
		else
		zip = 0
		end
		zip = 0 if zip == ""
		phone = $sql.escape(ar[5]) if ar[5] != nil
		url = ""
		req = "SELECT * FROM advisers WHERE name = '#{name}' AND zip = '#{zip}'"
		check = $sql.query(req)	
		if check.to_a.size == 0
			req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,rating_id) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',3)"
		$sql.query(req)
		else
#		p check.to_a
		end
	else
		firsline = false
	end
}
rescue
end