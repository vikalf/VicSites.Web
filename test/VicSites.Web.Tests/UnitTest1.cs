using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;
using System;
using VicSites.Web.Controllers;
using Xunit;

namespace VicSites.Web.Tests
{
    public class UnitTest1
    {

        private readonly Mock<ILogger<HomeController>> _mockLogger;

        public UnitTest1()
        {
            _mockLogger = new Mock<ILogger<HomeController>>();
        }

        [Fact]
        public void Test1()
        {
            var controller = new HomeController(_mockLogger.Object);
            var result = controller.Index();
            Assert.IsType<ViewResult>(result);
        }
    }
}
