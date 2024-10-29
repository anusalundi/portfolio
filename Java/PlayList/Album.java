package playlist;

import java.util.ArrayList;
import java.util.LinkedList;

public class Album {
    private String name;
    private String artist;
    private ArrayList<Song> songs;

    public Album(String name, String artist) {
        this.name = name;
        this.artist = artist;
        this.songs = new ArrayList<>();
    }

    private Song findSong(String title) {
        for (Song checkedSong : this.songs) {
            if(checkedSong.getName().equals(title)){
                return checkedSong;
            }
        }
        return null;
    }
    public boolean addSong(String title, double duration) {
        if (findSong(title) == null) {
            songs.add(new Song(title, duration));
            return true;
        }
        return false;
    }
    public boolean addToPlaylist(String title, LinkedList<Song> playList) {
        Song checkedSong = findSong(title);
        if (checkedSong == null) {
            System.out.println("Song not found");
            return false;
        }
        playList.add(checkedSong);
        return true;
    }
    public boolean addToPlaylist(int trackNumber, LinkedList<Song> playList) {
        int index = trackNumber - 1;
        if(index < 0 || index >= songs.size()) {
            System.out.println("Song not found");
            return false;
        }
        playList.add(songs.get(index));
        return true;
    }
}
