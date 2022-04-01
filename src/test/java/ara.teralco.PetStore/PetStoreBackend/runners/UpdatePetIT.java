package ara.teralco.PetStore.PetStoreBackend.runners;

import com.privalia.qa.utils.BaseGTest;
import io.cucumber.testng.CucumberOptions;


/**
 * This is the runner class responsible of running the included *.feature files in the project.
 * Glue files can be specified in the {@link CucumberOptions} annotation
 *
 * Here you can also create your own TestNG hooks or even configure parallel tests execution.
 * For more info on these topics check:
 * https://testng.org/doc/documentation-main.html#annotations
 * https://cucumber.io/docs/guides/parallel-execution/#testng
 */
@CucumberOptions(plugin = {
        "json:target/CucumberRunnerIT.json",
        "html:target/CucumberRunnerIT.html",
        "junit:target/CucumberRunnerIT.xml"
}, features =
        {
                "src/test/resources/features/PetStore/Pets/update_pet_api.feature"
        },
        glue = "classpath:ara.teralco.PetStore.PetStoreBackend.glue")

public class UpdatePetIT extends BaseGTest {

}