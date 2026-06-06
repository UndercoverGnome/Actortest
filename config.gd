#WORLD.GD - Autoloaded
extends Node

#CONFIGURABLE
const uitilesize = 32#32
const tickRate = 0.05#0.05
const cameraSpeed = 1000
const cameraRotationSpeed = 4
const renderDistance = 2#2

const phoneticalphabet = [
	'alfa',
	'bravo',
	'charlie',
	'delta',
	'echo',
	'foxtrot',
	'golf',
	'hotel',
	'india',
	'juliett',
	'kilo',
	'lima',
	'mike',
	'november',
	'oscar',
	'papa',
	'quebec',
	'romeo',
	'sierra',
	'tango',
	'uniform',
	'victor',
	'whiskey',
	'xray',
	'yankee',
	'zulu'
	]

const masculineForenames = [
	"James", "John", "Robert", "Michael", "William",
	"David", "Richard", "Joseph", "Thomas", "Charles",
	"Christopher", "Daniel", "Matthew", "Anthony", "Mark",
	"Donald", "Steven", "Paul", "Andrew", "Joshua",
	"Kenneth", "Kevin", "Brian", "George", "Timothy",
	"Ronald", "Jason", "Edward", "Jeffrey", "Ryan",
	"Jacob", "Gary", "Nicholas", "Eric", "Jonathan",
	"Stephen", "Larry", "Justin", "Scott", "Brandon",
	"Benjamin", "Samuel", "Gregory", "Alexander", "Patrick",
	"Frank", "Raymond", "Jack", "Dennis", "Jerry"
	]

const feminineForenames = [
	"Emma", "Olivia", "Ava", "Sophia", "Isabella",
	"Mia", "Charlotte", "Amelia", "Harper", "Evelyn",
	"Abigail", "Emily", "Ella", "Elizabeth", "Camila",
	"Luna", "Sofia", "Avery", "Mila", "Aria",
	"Scarlett", "Penelope", "Layla", "Chloe", "Victoria",
	"Madison", "Eleanor", "Grace", "Nora", "Riley",
	"Zoey", "Hannah", "Hazel", "Lily", "Ellie",
	"Violet", "Lillian", "Zoe", "Stella", "Aurora",
	"Natalie", "Emilia", "Everly", "Leah", "Aubrey",
	"Savannah", "Audrey", "Brooklyn", "Bella", "Claire"
	]

const surnames = [
	"Smith", "Johnson", "Williams", "Brown", "Jones",
	"Garcia", "Miller", "Davis", "Rodriguez", "Martinez",
	"Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson",
	"Thomas", "Taylor", "Moore", "Jackson", "Martin",
	"Lee", "Perez", "Thompson", "White", "Harris",
	"Sanchez", "Clark", "Ramirez", "Lewis", "Robinson",
	"Walker", "Young", "Allen", "King", "Wright",
	"Scott", "Torres", "Nguyen", "Hill", "Flores",
	"Green", "Adams", "Nelson", "Baker", "Hall",
	"Rivera", "Campbell", "Mitchell", "Carter", "Roberts"
	]
