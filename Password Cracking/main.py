from Crypto.Hash import SHA1, MD5

def main():
    print("Reading user info...")
    login, common_passwords = read_user_info()
    print("Getting md5 hashes...")
    md5_hashes = get_md5()
    print("Getting sha hashes...")
    sha = get_shas(common_passwords, md5_hashes)
    print("Getting final comparisons...")
    final_check(login, sha)

def read_user_info():
    # Reads txt file to get usernames and passwords, for string comparisons later.
    login = []
    common_passwords = ["123456","123456789","qwerty","password", "12345","qwerty123", "1q2w3e", "12345678", "111111","1234567890"]
    # Common passwords could have also been a file, but this works for now.
    with open("password.txt", "r") as f:
        data = f.read().split("\n")
    # Data is pure information
    for i in data:
        login.append(i.split(".")) #Login is a nested list. [[Username1, Password1], [Username2, Passoword2]]
    return login, common_passwords

def get_md5():
    # Gets md5 hash of user numbers.
    md5s = []
    for x in range(1,5):
        # This should probably not be hard coded, but it works for now.
        x = str(x)
        md5s.append(MD5.new(x.encode()).hexdigest())
    return md5s

def get_shas(common_passwords, md5s):
    # Gets the SHA hash of the md5 hash and the passwords.
    shas = []
    for i in common_passwords:
        for x in md5s:
            shas.append([SHA1.new((x+i).encode()).hexdigest(),i])
    return shas

def final_check(login, shas):
    # Performs final check of sha hashes and gathered hashes.
    for x in login:
        for y in shas:
            if y[0] == x[1]:
                print("Found!")
                print(x[0]+": "+y[1])
main()
    