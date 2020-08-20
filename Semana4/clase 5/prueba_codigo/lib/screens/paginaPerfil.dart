import 'package:flutter/material.dart';

class PaginaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigoAccent.shade100,
                    Colors.indigoAccent.shade700,
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context),
                buildHeaderComidas(context),
                buildListaComidas(context),
                buildHeaderPost(context),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fill,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Pastas',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fill,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Saludables',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fill,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.pexels.com/photos/3655916/pexels-photo-3655916.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Pescados',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fill,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hamburguesas',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderPost(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most Liked Post',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildListaComidas(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Pastas',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Saludables',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.pexels.com/photos/3655916/pexels-photo-3655916.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Pescados',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Hamburguesas',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderComidas(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Collection',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text('Create new'),
          ],
        ),
      ),
    );
  }

  Container buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      height: 240,
      // El stack permite superponer elementos, es una lsita con elementos donde todos empiezan al mismo nivel
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 40, top: 40),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Anthony Peña',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('CEO | PooPaye SAC'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '32',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'posts'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '32',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'posts'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              '32',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'posts'.toUpperCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://live.staticflickr.com/65535/50242998231_11e10a6261_c.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
