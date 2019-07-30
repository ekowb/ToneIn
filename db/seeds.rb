require "json"

# #  demo
# demo_response = HTTParty.get("https://itunes.apple.com/lookup?amgArtistId=468749,5723&entity=song&limit=5&sort=recent")
# # all albums link
# album_response = HTTParty.get("https://itunes.apple.com/in/rss/topalbums/limit=100/json")

# Alternative
# Blues
# Christian & Gospel
# Country
# Dance
# Electronic
# Hip-Hop/Rap
# Jazz
# Latin
# Pop
# R&B/Soul
# Rock

# Genres
    # 20 - Alternative
    alt_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=20/limit=200/json")
    alt_resp = JSON.parse(alt_url.body)
    # 2 - Blues
    blu_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=2/limit=200/json")
    blu_resp = JSON.parse(blu_url.body)
    # 22 - Christian & Gospel
    chr_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=22/limit=200/json")
    chr_resp = JSON.parse(chr_url.body)
    # 6 - Country
    cou_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=6/limit=200/json")
    cou_resp = JSON.parse(cou_url.body)
    # 17 - Dance
    dnc_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=17/limit=200/json")
    dnc_resp = JSON.parse(dnc_url.body)
    # 7 - Electronic
    elc_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=7/limit=200/json")
    elc_resp = JSON.parse(elc_url.body)
    # 18 - Hip-Hop/Rap
    hhr_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=18/limit=200/json")
    hhr_resp = JSON.parse(hhr_url.body)
    # 11 - Jazz
    jzz_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=11/limit=200/json")
    jzz_resp = JSON.parse(jzz_url.body)
    # 12 - Latin
    ltn_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=12/limit=200/json")
    ltn_resp = JSON.parse(ltn_url.body)
    # 14 - Pop
    pop_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=14/limit=200/json")
    pop_resp = JSON.parse(pop_url.body)
    # 15 - R&B/Soul
    rnb_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=15/limit=200/json")
    rnb_resp = JSON.parse(rnb_url.body)
    # 21 - Rock
    rck_url = HTTParty.get("https://itunes.apple.com/us/rss/topalbums/genre=21/limit=200/json")
    rck_resp = JSON.parse(rck_url.body)

    genres = [alt_resp, blu_resp, chr_resp, cou_resp, dnc_resp, elc_resp, hhr_resp, jzz_resp, ltn_resp, pop_resp, rnb_resp, rck_resp]


# json_resp1 = JSON.parse(album_response.body)
# json_resp2 = JSON.parse(genre_response.body)

# iterate through album array
# for each element create album 

# For each genre in our array
genres.each do |g|
    # For each album in a genre
    g["feed"]["entry"].each do |a, v|
        Album.create(title: a['im:name']["label"], # album title: string
                    artist: a['im:artist']["label"], # artist name: string      
                    image_url: a['im:image'][2]["label"], # image url: string
                    songs: a['im:itemCount']["label"], # array of songs for each album: string array
                    release_date: a['im:releaseDate']["label"], # release date: datetime
                    genre: a['category']["attributes"]["label"], # genre id: integer
                    color: "", # hex color: string
                    like_count: 0) # like_count: integer
    end

end



# 19 - World
# 16 - Soundtrack
# 13 - New Age
# 5 - Classical


