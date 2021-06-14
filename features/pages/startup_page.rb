class Startup
    include HTTParty
    require_relative '../hooks/startup_hook'
    base_uri "https://60c75d0c06f3160017d29271.mockapi.io/api/v1"

    def initialize(body)
        @options = {:body => body}
        @options2 ={}
    end

    def postStartup
        self.class.post("/cidades", @options)
    end

    def getStartup (id)
        self.class.get("/cidades/#{id}", @options2)
    end

    def putStartup (id)
        self.class.put("/cidades/#{id}", @options)
    end

    def deleteStartup (id)
        self.class.delete("/cidades/#{id}", @options2)
    end
end