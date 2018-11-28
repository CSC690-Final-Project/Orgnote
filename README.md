# *Orgnote*

**Orgnote** is an app that help users to track items and inventories base on storage locations.

## User Stories

The following **required** user stories are complete:

- [ ] User can add an item with item name, category, location, description. 
- [ ] The app can save added item in device. 
- [ ] User can view all item in list view.
- [ ] User can take add a photo per item.
- [ ] User can view item details. 
- [ ] User can delete item.

The following **stretch** user stories are implemented:

- [ ] User can search item in all item list view.
- [ ] User can search location in location list view. 
- [ ] User can view items in list filter by locations.
- [ ] User can edit and modify item data, such as location, name, change photo, description.
- [ ] User can clear all data in Setting


## Workflow

1. ```git pull origin dev``` to pull code from the remote dev branch to your local dev branch so that you have the most up-to-date version of the code.

2. ```git checkout -b [your_branch_name] origin/dev``` to create a branch off of origin/dev and check out that new branch for development. Use this format to name your branch: milestone#/issue#, e.g. m2/issue1

3. Make changes in your feature branch, commit your code to save changes locally. Make sure you put your issue number in your final commit. One trick is that, if you add the keyword "fix" with your issue number in your commit message, GitHub will automatically close the issue for you when your branch is merged into master. e.g. ```git commit -am "fix #2: Added styling to home page"```

4. When you're ready to push, make a final test and screenshot your test result.

5. ```git push origin [your_branch_name]``` to push changes to GitHub.

6. It'll prompt you to make a ```pull request``` on GitHub to merge your feature branch to dev. So do that (add the issue # and your test screenshot to the pull request) and add someone who knows your code well to be the reviewer.

7. The reviewer will review the code (review the diffs or create a new branch in your local environment and pull the changes to test it out). If everything looks good, approve and assign the request back to the developer.

## Wireframe

<img src='https://github.com/CSC690-Final-Project/Orgnote/blob/master/demo%20src/wireframe.png' title='Wireframe' width='' alt='Wireframe' />


## Demo Walkthrough

Here's a walkthrough of implemented user stories:

<img src='#' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## License

Copyright [2018] [PoHung Wang & XiaoQian Huang]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
