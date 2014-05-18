
# User.destroy_all
# Restaurant.destroy_all

def uniq_camis(boro)
	camis = []
	boro.each do |number|
		camis.push(number[0])
	end
	camis.uniq 
end

def add_to_rest_hash(hash,boro,keys)
	keys.each do |key|
		hash[boro][key.to_sym] = []
	end
end
def add_by_camis(hash,boro,restaurants)
	restaurants.each do |one_resto|
		hash[boro][one_resto[0].to_sym].push(one_resto)
	end
end
def seed_me(hash, boro, geocoded)
	geocode = geocoded
	hash[boro].each do |camis,inspections|

		## Seed the Restos
		# begin
		# 	Restaurant.create(camis: inspections.first[0], name: inspections.first[1], address: inspections.first[3] + " " + inspections.first[4], zip: inspections.first[5], grade: inspections.first[12], boro: inspections.first[2], lat: geocode[inspections.first[0].to_sym][0], long: geocode[inspections.first[0].to_sym][1])
		# rescue
		# 	Restaurant.create(camis: inspections.first[0], name: inspections.first[1], address: inspections.first[3] +" "+ inspections.first[4], zip: inspections.first[5], grade: inspections.first[12], boro: inspections.first[2], lat: 0.00, long: 0.00)
		# end

		### Seed the inspections
		inspections.each do |inspection|
			Inspection.create(score: inspection[11].to_i, violation: inspection[10], inspected_on: inspection[8], restaurant_id: Restaurant.find_by(camis: inspection[0]).id)
		end
	end
end

manhattan = []
brooklyn = []
queens = []
bronx = []
staten = []
read_in = File.new("/Users/macadocious/Development/dinr_app/seeders/WebExtract.txt", "r")
read_in.each do |line|

	b = line.split("\",\"")
	b[0] = b[0][1..8]
	if b[8][0..3] == "2013"
		boro = b[2]
		case boro
		when "1"
			manhattan << b[0..13]
		when "2"
			bronx << b[0..13]
		when "3"
			brooklyn << b[0..13]
		when "4"
			queens << b[0..13]
		when "5"
			staten << b[0..13]
		end
	end
end
read_in.close
man_camis = uniq_camis(manhattan)
bk_camis = uniq_camis(brooklyn)
bx_camis = uniq_camis(bronx)
q_camis = uniq_camis(queens)
s_camis = uniq_camis(staten)

rest_hash = {manhattan: {}, brooklyn: {}, queens: {}, bronx: {}, staten: {}}

add_to_rest_hash(rest_hash,:manhattan,man_camis)
add_to_rest_hash(rest_hash, :brooklyn, bk_camis)
add_to_rest_hash(rest_hash, :bronx, bx_camis)
add_to_rest_hash(rest_hash, :queens, q_camis)
add_to_rest_hash(rest_hash, :staten, s_camis)

add_by_camis(rest_hash,:manhattan,manhattan)
add_by_camis(rest_hash,:brooklyn,brooklyn)
add_by_camis(rest_hash,:bronx,bronx)
add_by_camis(rest_hash,:queens,queens)
add_by_camis(rest_hash,:staten,staten)

geocode = {}
long_lat = File.open("/Users/macadocious/Development/dinr_app/seeders/latlong.csv","r")
long_lat.each do |one|
	split_up = one.split(",")
	geocode[split_up[0].to_sym] = [split_up[4],split_up[5].gsub("\n","")]
end
long_lat.close
seed_me(rest_hash,:manhattan,geocode)
seed_me(rest_hash,:brooklyn,geocode)
seed_me(rest_hash,:bronx,geocode)
seed_me(rest_hash,:queens,geocode)
seed_me(rest_hash,:staten,geocode)

# user = User.create(user: "Alfred", email: "a@b.c", password: "a", password_confirmation: "a")
