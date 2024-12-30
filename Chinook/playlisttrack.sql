CREATE TABLE playlisttrack(
playlistid INT,
trackid INT,
FOREIGN KEY (playlistid) REFERENCES playlist(playlistid),
FOREIGN KEY (trackid) REFERENCES track(trackid)
);