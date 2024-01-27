part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) {
        context.read<PageBloc>().add(GoToMainPage());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: <Widget>[
                  const Text("halo"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // context.read<PageBloc>().add(GoToEditProfilePage());
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child:
                                    Image.asset("assets/edit_profile.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Edit Profile",
                              style: blackTextFont.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<PageBloc>()
                              .add(GoToWalletPage(GoToProfilePage()));
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset("assets/my_wallet.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "My Wallet",
                              style: blackTextFont.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/language.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Change Language",
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/help_centre.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Help Centre",
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/rate.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Rate Flutix App",
                            style: blackTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await AuthServices.signOut();
                          // context.read<UserBloc>().add(SignOut());context.read<UserBloc>().add(SignOut());
                        },
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 3, 9, 3),
                                      color: accentColor2,
                                    ),
                                    Icon(
                                      MdiIcons.logout,
                                      color: mainColor,
                                      size: 24,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sign Out",
                              style: blackTextFont.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 16),
                        child: generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin),
              child: GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToMainPage());
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
