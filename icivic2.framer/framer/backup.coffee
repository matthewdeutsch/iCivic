# This imports all the layers for icivic
reportLayers = Framer.Importer.load "imported/icivic2"

for layerGroupName of reportLayers
  window[layerGroupName] = reportLayers[layerGroupName]

for layerGroupName of reportLayers
  reportLayers[layerGroupName].originalFrame = window[layerGroupName].frame

# Initial states
report_list.opacity = 0
report_item.opacity = 0
report_item.visible = false
report_bar2.visible = false
report_bar2.opacity = 0
report_item.x = -500

#Intialize background color
layerA = new BackgroundLayer({backgroundColor:"#EAE8E8"})

#Intialize spinner
spinner = new Layer()
spinner.image = "images/spinner.gif"
spinner.midX = report_list.midX
spinner.y = 182
spinner.scale = 1.2
spinner.opacity = 0

report_blank.animate
	properties:
		opacity: 0
	time: .5
	delay: 3
		
# On a click, go to the next state
report_submit.on Events.TouchStart, ->
	report_submit.animate
		properties:
			scale: .95
		time: 0.1

report_submit.on Events.TouchEnd, ->
	report_submit.animate
		properties:
			scale: 1
	
	report_bar.visible = false
	
	report_bar2.visible = true
	report_bar2.animate
		properties:
			opacity: 1
		time: .5
	
	report.animate
		properties:
			y: report.y - 1000
			opacity: 0
		curve: "cubic-bezier(0.645, 0.045, 0.355, 1)"
		time: .5

	report_list.visible = true
	report_list.animate
		properties:
			opacity: 1
			y: report_list.y + 195
		time: 1
		

	
	spinner.animate
		properties:
			opacity: 1
		delay: .5
		time: 1.7
	
spinner.on Events.AnimationStop, ->
	spinner.opacity = 0
	report_submit.visible = false
	report_item.opacity = 1
	
	report_item.visible = true
	report_item.animate
		properties:
			x: report_item.x + 500
		time: .5
		curve: "spring(200, 15, 10)"
	
