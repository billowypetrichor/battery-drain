using Microsoft.AspNetCore.Mvc;

namespace DotNetHelloWorld.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HelloController : ControllerBase
    {
        [HttpGet]
        public string Get()
        {
            return "Hello, Docker!";
        }
    }
}