
# Social media app

> In this project, users can sign up and create posts. Moreover it inherits the core functionality of social media sites
> such as facebook.com. Users can send request to one another and view the posts written by the user or from the user's
> friend list.

## Features

- Allow users to send a friend request to other users
- Multiple request states, such as,
    - Invite to friendship
    - Accept friendship
    - Reject friendship
    - Cancel friend request sent
    - Remove friend from the list
- Show posts written by the user and by the user's friends
- List all mutual friends of a user
- Followed TDD
- End to end testing

## Built With

- Ruby v2.7.2
- Ruby on Rails v5.2.4

## Live Demo

TBA

## Getting Started

- Clone the repo `https://github.com/keneogu/ror-social-scaffold.git`
- `cd` into the project
- Run `git pull origin friendship_v2`
- Run `bundle install`
- Run `rails db:create` and `rails db:migrate`
- Run `rails s` and visit `localhost:3000`

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.

## Testing

In order to run the tests, RSPEC should be installed.

- Please run the following command line in your terminal to install :

```bash
gem install rspec
```

- When the installation is complete, type this command inside `ror_social_scaffold` folder to run the tests :

```bash
rspec
```

### Deployment

TBA

## Authors

### 👨‍💻 Kenechukwu Oguagbaka

- GitHub: [@keneogu](https://github.com/keneogu)
- Twitter: [@keneogu](https://twitter.com/keneogu)
- LinkedIn: [@keneogu](https://www.linkedin.com/in/kene-ogu/)

### 👨‍💻 Amit Kumar

- GitHub: [@KumarAmitt](https://github.com/KumarAmitt)
- Twitter: [@ArrshAmit](https://twitter.com/ArrshAmitt)
- LinkedIn: [@kumar-amitt](https://www.linkedin.com/in/kumar-amitt)



## 🤝 Contributing

- Fork the project
- Create your feature branch `git checkout -b awesome-feature`
- Commit your changes `git commit -m 'Awesome feature'`
- Push it `git push -u origin awesome-feature`
- Open a pull request using this branch

## Show your support

Give a ⭐️ if you like this project!