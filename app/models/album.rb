class Album < ApplicationRecord

    def self.set_colors
        self.all[2001..2400].each do |a|
            a.color = a.find_main_color
            a.update_attribute(:color, a.find_main_color)

        end
    end


    def find_main_color
        top_colors = Miro::DominantColors.new(self.image_url)
        main_color = top_colors.to_hex.first
        # return main_color
    end

    def self.find_rgb
        self.all.each do |a|
            top_colors = Miro::DominantColors.new(a.image_url)
            sum_rgb = 0
            top_colors.to_rgb.first.each do |c|
                sum_rgb += c
            end
            if (sum_rgb < 60)
                main_rgb = top_colors.to_rgb.second
            else
                main_rgb = top_colors.to_rgb.first
            end
            a.rgb = main_rgb
            a.update_attribute(:rgb, main_rgb)
        end
    end


    def self.read_colors
        hash_array = []
        File.open("satfaces.txt").each do |line|
            color_hash = Hash.new
            color_hash[:name] = line.match(/[a-zA-Z]+/).to_s
            color_hash[:rgb] = line.match(/\d+\,\s\d+\,\s\d+/).to_s.split(", ")
            color_hash[:rgb].map!(&:to_i)
            hash_array << color_hash
        end
        self.all.each do |a|

            # the rgb of each album equals the found rgb
            
            # for the color catgeory find the rgb that matches the album's rgb in the hash
            pencil = hash_array.find do |h|
                "#{h[:rgb]}" == a.rgb
            # and return its name
            end

            if pencil != nil
                a.color_category = pencil[:name]
                a.save
            else
                "nah"
            end
        end
    end




end

