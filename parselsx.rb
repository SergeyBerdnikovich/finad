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
		zip.gsub!(/[^0-9]/,"")
		zip = 0 if zip.blank?
		phone = $sql.escape(ar[6]) if ar[6] != nil
		if ar[7] != nil
			url = $sql.escape(ar[7])
		else
			url = ""
		end
		req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,stars) VALUES ('#{name}','#{address}','#{city}','#{state}',#{zip},'#{phone}','#{url}',2)"
		$sql.query(req)	
	else
		firsline = false
	end
}

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
		zip.gsub!(/[^0-9]/,"")
		zip = 0 if zip.blank?
		phone = $sql.escape(ar[5]) if ar[5] != nil
		url = ""
		req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,stars) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',2)"
		$sql.query(req)	
	else
		firsline = false
	end
}

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
		zip.gsub!(/[^0-9]/,"")
		zip = 0 if zip.blank?
		phone = $sql.escape(ar[5]) if ar[5] != nil
		url = ""
		req = "INSERT INTO advisers (name,address,city,state,zip,phone,url,stars) VALUES ('#{name}','#{address}','#{city}','#{state}','#{zip}','#{phone}','#{url}',2)"
		$sql.query(req)	
	else
		firsline = false
	end
}