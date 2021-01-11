using System;

namespace Assi3
{
    class Request : Command
    {
        public Request(string route, int payload) {
            Route = route;
            Payload = payload;
        }
        
        public string Route;
        public int Payload;

        public int Execute(Route route)
        {
            return route.HandleRequest(this);
        }
    }
}
