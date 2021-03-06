-- project.pig

register 'repo/com/twitter/elephant-bird/2.1.10/elephant-bird-2.1.10.jar';

-- data format
--{"filter_level":"medium", "retweeted":false, "in_reply_to_screen_name":null,
--"possibly_sensitive":false, "truncated":false, "lang":"nl",
--"in_reply_to_status_id_str":null, "id":"123456", "in_reply_to_user_id_str":null,
--"in_reply_to_status_id":null, "created_at":"Wed Nov 27 10:26:49 +0000 2013",
--"favorite_count":0, "place":null, "coordinates":null, "twinl_source":["track"],
--"text":"Wat is big data (...)", "contributors":null, "geo":null, "entities":{"
--symbols":[], "urls":[{"expanded_url":"http:\/\/...", "indices":[111,133],
--"display_url":"bit.ly\/...", "url":"http:\/\/t.co\/..."}], "hashtags":[],
--"user_mentions":[]}, "source":"web", "favorited":false, "in_reply_to_user_id":
--null, "retweet_count":0, "id_str":"405643870785904640", "user":{"location":"",
--"default_profile":true, "statuses_count":68, "profile_background_title":false,
--"lang":"en", "profile_link_color":"0084B4", "id":183749925, "following":null,
--"favourites_count":0, "protected":false, "profile_text_color":"333333",
--"description":"Dit jaar wordt (...)", "verified":false, "contributors_enabled":
--false, "profile_sidebar_border_color":C0DEED", "name":"SNiC Symposium",
--"profile_background_color":C0DEED", "created_at":"Fri Aug 27 20:15:17 +0000
--2010", "default_profile_image":false, "followers_count":49,
--"profile_image_url_https":"https:\/\/pbs.tw...", "geo_enabled":false,
--"profile_background_image_url":"http:\/\/abs.twimg..."

-- the script to have the structure of data
tweets = LOAD '/data/twitterNL/' USING com.twitter.elephantbird.pig.load.JsonLoader('-nestedLoad') as (json: map[]);
DESCRIBE tweets;
