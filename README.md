# objetivec
Access to stack overflow Api 2.2 sample

This project leads to the Api access Stackoverflow for the last 40 entries. 

#define URL_PETICION 
@"https://api.stackexchange.com/2.2/questions?page=1&pagesize=40&order=desc&sort=activity&site=stackoverflow"

The results are filtered according to whether they contain answers.

You get a JSON becomes NSDictionary and then entities to display in a UITableView.
There are two sections that group which contain or no answers.
