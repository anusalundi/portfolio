package playlist;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        Song testSong = new Song("abc", 1);
        System.out.println(testSong);

        ArrayList<Album> albums = new ArrayList<>();

        Album album;
        album = new Album("Best Hits", "Joe");
        album.addSong("The onliest Love", 1);
        album.addSong("Summertime", 2);
        album.addSong("White Lady", 3);
        album.addSong("You and Me", 4);
        album.addSong("Goodbye", 5);
        album.addSong("Blue Lake", 6);
        album.addSong("Only You", 7);
        album.addSong("Mystery", 8);
        album.addSong("Night", 9);
        album.addSong("You", 10);
        albums.add(album);

        album = new Album("Best Hits 2", "George");
        album.addSong("Sea", 1);
        album.addSong("Christmas", 2);
        album.addSong("Summer", 3);
        album.addSong("Yesterday", 4);
        album.addSong("Yellow Submarine", 5);
        album.addSong("Hei", 6);
        album.addSong("Loan", 7);
        album.addSong("Bear", 8);
        album.addSong("Black Night", 9);
        album.addSong("You and He", 10);
        albums.add(album);

        LinkedList<Song> playlist = new LinkedList<>();
        albums.get(0).addToPlaylist("You", playlist);
        albums.get(0).addToPlaylist("White Lady", playlist);
        albums.get(0).addToPlaylist(1, playlist);
        albums.get(0).addToPlaylist(2, playlist);

        albums.get(1).addToPlaylist("Yellow Submarine", playlist);
        albums.get(1).addToPlaylist("Yesterday", playlist);
        albums.get(1).addToPlaylist(9, playlist);
        albums.get(1).addToPlaylist(10, playlist);

        albums.get(0).addToPlaylist("New song", playlist);
        albums.get(1).addToPlaylist(15, playlist);

        play(playlist);
    }

    private static void play(LinkedList<Song> playlist) {
        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        ListIterator<Song> listIterator = playlist.listIterator();
        boolean goingForward = true;

        printMenu();
        if(playlist.isEmpty()) {
            System.out.println("The Playlist is empty");
        }
        System.out.println("Now is playing: " + listIterator.next());

        while(!quit) {
            System.out.println("Enter your choice: ");
            int action = scanner.nextInt();
            scanner.nextLine();

            switch(action) {
                case 0:
                    System.out.println("Thank you for playing!");
                    quit = true;
                    break;
                case 1:
                    if(!goingForward){
                        if(listIterator.hasNext()) {
                            listIterator.next();
                        }
                    }
                    goingForward = true;
                    if(listIterator.hasNext()) {
                        System.out.println("Now playing: " + listIterator.next());
                    } else {
                        System.out.println("You are at the end of the playlist");
                        goingForward = false;
                    }
                    break;
                case 2:
                    if(goingForward) {
                        if(listIterator.hasPrevious()) {
                            listIterator.previous();
                        }
                    }
                    goingForward = false;
                    if(listIterator.hasPrevious()) {
                        System.out.println("Now playing: " + listIterator.previous());
                    } else {
                        System.out.println("You are at the beginning of the playlist");
                        goingForward = true;
                    }
                    break;
                case 3:
                    if(goingForward) {
                        if(listIterator.hasPrevious()) {
                            System.out.println("Now playing: " + listIterator.previous());
                            goingForward = false;
                        } else {
                            System.out.println("You are at the beginning of the playlist");
                        }
                    } else {
                        if(listIterator.hasNext()) {
                            System.out.println("Now playing: " + listIterator.next());
                            goingForward = true;
                        } else {
                            System.out.println("You are at the end of the playlist");
                        }
                    }
                    break;
                case 4:
                    printList(playlist);
                    break;
                case 5:
                    printMenu();
                    break;
                case 6:
                    if(!playlist.isEmpty()) {
                        listIterator.remove();
                        System.out.println("The song is deleted");
                        if(listIterator.hasNext()) {
                            System.out.println("Now playing: " + listIterator.next());
                            goingForward = true;
                        } else if(listIterator.hasPrevious()) {
                            System.out.println("Now playing: " + listIterator.previous());
                            goingForward = false;
                        }
                    } else {
                        System.out.println("List is empty, it's not possible to delete");
                    }
                    break;
            }
        }
    }

    private static void printMenu() {
        System.out.println("""
                Menu:
                0 - Quit
                1 - Next song
                2 - Previous song
                3 - Repeat song
                4 - Show the song on the List
                5 - Show the chooses
                6 - Delete the song
                """);
    }

    private static void printList(LinkedList<Song> playlist) {
        Iterator<Song> iterator = playlist.iterator();
        System.out.println("===========================");
        while(iterator.hasNext()) {
            System.out.println(iterator.next());
        }
        System.out.println("===========================");
    }

}
