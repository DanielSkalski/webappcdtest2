using WebAppCdTest2.Pages;
using Xunit;

namespace WebAppCdTest2.Tests
{
    public class AboutModelTests
    {
        private readonly AboutModel _model; 

        public AboutModelTests()
        {
            _model = new AboutModel();
        }

        [Fact]
        public void AboutModel_OnGet_HasCorrectMessage()
        {
            // act
            _model.OnGet();

            // assert
            Assert.Equal("Your application description page.", _model.Message);
        }
    }
}
