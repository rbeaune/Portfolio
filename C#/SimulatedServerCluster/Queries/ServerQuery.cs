using System;

namespace Assi3
{
    class ServerQuery : Query
    {
        public bool CheckServer(Server s)
        {
            return s.Available();
        }
    }
}
