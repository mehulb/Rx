//
//  RootTableViewController.m
//  Rx
//
//  Created by Mehul Bhavani on 18/08/17.
//  Copyright © 2017 mehulb. All rights reserved.
//

#import "RootTableViewController.h"
#import "PNRViewController.h"

#define CIRCLE_EMPTY    @"○"
#define CIRCLE_FILLED   @"●"

@interface RootTableViewController ()

@end

@implementation RootTableViewController
{
    NSArray *dataSource;
}

- (NSArray *)data
{
    return @[
             @{
              @"name"          :@"Creon 10000",
              @"generic"       :@"Pancreatin Minimicrospheres",
              @"weight"        :@"10000 IU",
              @"company"       :@"Abbott India Limited",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"1:1:1",
              @"distributor"   :@"Padma Medical Agency",
              },
             @{
              @"name"          :@"Cromoplex Forte",
              @"generic"       :@"Capsules of Chromium Picolinate, Vitamins & Zinc",
              @"weight"        :@"",
              @"company"       :@"Ostira Genetics/Aristo Pharma",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"0:1:0",
              @"distributor"   :@"Ramesh Medical Agency",
              },
             @{
              @"name"          :@"Carofit Plus",
              @"generic"       :@"Beta Carotine + MultiMinerals",
              @"weight"        :@"",
              @"company"       :@"Ajanta Pharma",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"0:0:1",
              @"distributor"   :@"",
              },
             @{
              @"name"          :@"Bigomet SR 1000",
              @"generic"       :@"Metformin Extended Release",
              @"weight"        :@"1000 mg",
              @"company"       :@"Ostira Genetics/Aristo Pharma",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"1:0:1",
              @"distributor"   :@"Ramesh Medical Agency",
              },
             @{
              @"name"          :@"Lipikind 10",
              @"generic"       :@"Atorvastatine Calcium",
              @"weight"        :@"10 mg",
              @"company"       :@"Mankind Pharma",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"0:0:1",
              @"distributor"   :@"",
              },
             @{
              @"name"          :@"Neurobion Forte",
              @"generic"       :@"Vitmin B Complex + B12",
              @"weight"        :@"",
              @"company"       :@"Merck Limited",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"0:0:1",
              @"distributor"   :@"",
              },
             @{
              @"name"          :@"Pantakind 40",
              @"generic"       :@"Pantoprazole",
              @"weight"        :@"40 mg",
              @"company"       :@"Mankind Pharma",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"1:0:0",
              @"distributor"   :@"",
              },
             @{
              @"name"          :@"Enapril 5",
              @"generic"       :@"Enalapril Maleate",
              @"weight"        :@"5 mg",
              @"company"       :@"Intas Pharma",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"1:0:0",
              @"distributor"   :@"",
              },
             @{
              @"name"          :@"Amlosafe 5",
              @"generic"       :@"Amlodopine",
              @"weight"        :@"5 mg",
              @"company"       :@"Aristo Pharma",
              @"price"         :@"0.00",
              @"qty"           :@"",
              @"dosage"        :@"1:0:1",
              @"distributor"   :@"",
              }
             ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Rx";
    dataSource = [[NSArray alloc] initWithArray:[self data]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"PNR" style:UIBarButtonItemStylePlain target:self action:@selector(pnrBarButtonItem_Tapped)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pnrBarButtonItem_Tapped {
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(PNRViewController.class)] animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    NSDictionary *dict = dataSource[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    cell.detailTextLabel.text = [self dotsForDosage:dict[@"dosage"]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)dotsForDosage:(NSString *)dosage
{
    NSArray *arr = [dosage componentsSeparatedByString:@":"];
    NSMutableString *dots = [@"" mutableCopy];
    if(arr.count == 3) {
        if([arr[0] isEqualToString:@"0"]) {
            [dots appendString:CIRCLE_EMPTY];
        }
        else {
            [dots appendString:CIRCLE_FILLED];
        }
        [dots appendString:@" "];
        if([arr[1] isEqualToString:@"0"]) {
            [dots appendString:CIRCLE_EMPTY];
        }
        else {
            [dots appendString:CIRCLE_FILLED];
        }
        [dots appendString:@" "];
        if([arr[2] isEqualToString:@"0"]) {
            [dots appendString:CIRCLE_EMPTY];
        }
        else {
            [dots appendString:CIRCLE_FILLED];
        }
    }
    else {
        dots = [dosage mutableCopy];
    }
    return dots;
}

@end
