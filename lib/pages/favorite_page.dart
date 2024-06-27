import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:project1/providers/favorite_provider.dart";

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    // favorite provider to save the item to favorites list 
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return Scaffold(
      // tell user list is empty if so else show the item in the list
      body: finalList.isNotEmpty
      ? Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // saved items heading
                Text(
                  'Saved Items',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        // slidable delete button
                        SlidableAction(
                          onPressed: (context) {
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        )
                      ],
                    ),
                    // list items
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: ListTile(
                        // item name
                        title: Text(
                          finalList[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // item description
                        subtitle: Text(
                          finalList[index].description,
                          overflow: TextOverflow.ellipsis
                        ),
                        // item image
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            finalList[index].image![0],
                          ),
                          backgroundColor: Colors.deepPurple[100],
                        ),
                        // item price
                        trailing: Text(
                          '₹${finalList[index].price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        tileColor: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
          )
        ],
      )
      // tell the user that the list is empty
      : Center(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Column(
              children: [
                Image.asset(
                  'lib/images/favorite_empty.png',
                  height: 220,
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "You haven't saved anything yet. Save them now!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 88, 158)
                    )
                  ),
                ),
              ]
            )
        ),
      )
    );
  }
}