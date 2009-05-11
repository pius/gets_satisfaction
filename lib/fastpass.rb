require 'active_support'
require 'oauth'
require 'oauth/client/net_http'
require 'erb'

module FastPass
  extend ERB::Util
  DOMAIN = "getsatisfaction.com"
  
  def self.url(key, secret, email, name, uid, secure=false, private_fields={})
    consumer = OAuth::Consumer.new(key, secret)
    uri = URI.parse(secure ? "https://#{DOMAIN}/fastpass" : "http://#{DOMAIN}/fastpass")
    params = private_fields.merge(:email => email, :name => name, :uid => uid)
    
    uri.query = params.to_query
    
    http      = Net::HTTP.new(uri.host, uri.port)
    request   = Net::HTTP::Get.new(uri.request_uri)
    request.oauth!(http, consumer, nil, :scheme => 'query_string')
    
    signature = request.oauth_helper.signature
    #re-apply params with signature to the uri
    query = params.merge(request.oauth_helper.oauth_parameters).merge("oauth_signature" => signature)
    uri.query = query.to_query
    return uri.to_s
  end
  
  def self.image(*args)
    url = url(*args)
    %Q{<img src="#{h url}" alt="" />}
  end
  
  def self.script(*args)
    url = url(*args)
    
    <<-EOS
    <script type="text/javascript">

      (function(){
        add_js = function(jsid, url) {
          var head = document.getElementsByTagName("head")[0];
          script = document.createElement('script');
          script.id = jsid;
          script.type = 'text/javascript';
          script.src = url;
          head.appendChild(script);
        }

        add_js("fastpass_common", "http://#{DOMAIN}/javascripts/fastpass.js");

        if(window.onload) { var old_load = window.onload; }
        window.onload = function() {
          if(old_load) old_load();
          add_js("fastpass", #{url.to_json});
        }
      })()

    </script>
    EOS
  end
end