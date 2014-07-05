module PacketPagesHelper
	def get_question_layout(type)
		question_render = nil

		if params[:type] == "MC"
			question_render = render_to_string partial: 'packet_pages/question_partials/mc_question'
		elsif params[:type] == "IMC"
			question_render = render_to_string partial: 'packet_pages/question_partials/imc_question'
		elsif params[:type] == "FIB"
			question_render = render_to_string partial: 'packet_pages/question_partials/fib_question'
		end

		return question_render
	end

	def create_xml(params)
		require "builder"

		builder = Builder::XmlMarkup.new(:indent=>2)
		builder.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
		
		id_list = Array.new
		params.keys.each do |key|
			if key =~ /type-[0-9]+/
				id_list.push(key.scan(/[0-9]+/)[0])
			end
		end

		xml = builder.packet { |b| 

			id_list.each do |id|
				b.exercise { |e|
					e.id(id)
					e.type(params["type-#{id}"])
					e.question(params["question-#{id}"])
					e.answer()
					e.hint(params["hint-#{id}"])

					if (params["type-#{id}"] == "MC")
						e.choices{ |c|
							c.choiceA(params["optionA-#{id}"])
							c.choiceB(params["optionB-#{id}"])
							c.choiceC(params["optionC-#{id}"])
							c.choiceD(params["optionD-#{id}"])
						}
					elsif (params["type-#{id}"] == "IMC")
					elsif (params["type-#{id}"] == "FIB")
					end

				}
			end
		}

		puts "\n\n"
		puts params
		puts "\n\n"
		puts xml
		puts "\n\n"
		
		File.open("#{params[:title]}.xml", "w"){ |f| f.write(xml) }

		file = File.open("#{params[:title]}.xml")
		return file
		
	end
end