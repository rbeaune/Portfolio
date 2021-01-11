using System;

namespace Assi3
{
    interface AbstractServer
    {
        bool Available();
        bool Accept(Query query);
        void SetRequest(Request r);
    }
}
