import "@typespec/rest";
import "@typespec/openapi3";

import "../models/customer.tsp";
import "../models/problemdetails.tsp";

using TypeSpec.Http;

@doc("A service for managing customers")
@service({
    title: "Customer Service",
    version: "1.0.0",
})
namespace CustomerService;

@route("/customers")
@tag("customers")
@summary("A collection of customers")
interface Customers {
    @get list(): Customer[] | ProblemDetails;
    @get read(@path id: string): Customer | ProblemDetails;
    @post create(): {@statusCode _: 201 | 404, ...Customer} | ProblemDetails;
    @patch update(...Customer): Customer | ProblemDetails;
    @delete delete(@path id: string): Customer | ProblemDetails;
}

