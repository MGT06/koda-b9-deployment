# koda-b9-deployment

Dokumentasi pengerjaan tugas Linux User, Group & Permission Management.

---

## 1. Initial Setup (buat user, group, dan directory)

<img width="818" height="325" alt="Screenshot_1" src="https://github.com/user-attachments/assets/5264deb3-5e99-4a7b-8d07-e2b6566e0234" />
<img width="591" height="201" alt="Screenshot_1-2" src="https://github.com/user-attachments/assets/1f5feed7-a0cc-47c4-8438-0184d784eeed" />

---

## 2. Make koda the owner and devteam the group owner of /srv/projectX.

<img width="691" height="167" alt="Screenshot_2" src="https://github.com/user-attachments/assets/c909b774-c020-43f4-bfd6-e42ec610f191" />

---

## 3. Restricting access
 
a. Ensure that:
   i. Owner: full access
   ii. Group: read and execute
   iii. Others: no access
 
b. Use numeric/absolute mode.

<img width="613" height="164" alt="Screenshot_3" src="https://github.com/user-attachments/assets/45ef85a9-adad-4d26-93bb-ff4223fdba19" />

---

## 4. As user koda, create the following structure:

<img width="833" height="521" alt="Screenshot_4" src="https://github.com/user-attachments/assets/e5f06ef1-e738-4402-83df-45961c770a1a" />
<img width="536" height="414" alt="Screenshot_4-2" src="https://github.com/user-attachments/assets/e4b32956-dc3e-4532-b487-18b65b15f57e" />


---

## 5. Fixing permissions
 
a. The script app.sh must:
   i. Be executable by owner and group
   ii. Not executable by others
 
b. Use symbolic mode to modify permissions.

<img width="625" height="343" alt="Screenshot_5" src="https://github.com/user-attachments/assets/9837f84b-a231-4d16-9400-abefaf6d9a22" />

---

## 6. Protecting sensitive data
 
a. The file data/input.txt contains sensitive information.
 
b. Set permissions so that:
   i. Only the owner can read and write
   ii. No one else has any access

<img width="647" height="344" alt="Screenshot_6" src="https://github.com/user-attachments/assets/d2e755cf-8ea1-40ce-b8cd-c619ba8f21a9" />


---

## 7. Allow group collaboration
 
a. All members of devteam should:
   i. Be able to read and write files in src
   ii. Be able to access the directory
 
b. Apply permissions recursively (-R) to the src directory.

<img width="836" height="458" alt="Screenshot_7" src="https://github.com/user-attachments/assets/48ce1922-1f6f-4eac-85a5-ec7500af0530" />

---

## 8. Change ownership too
 
a. The project is now maintained by the team.
 
b. Change ownership of all files and directories under /srv/projectX so that:
   i. Owner: koda
   ii. Group: devteam
 
c. Use a single command.

<img width="680" height="297" alt="Screenshot_8" src="https://github.com/user-attachments/assets/ead1bd4a-93c1-4472-b914-e8c2734e2615" />

---

## 9. Prevent accidental deletion
 
a. Set the permissions so that:
   i. Files inside /srv/projectX cannot be deleted by users outside devteam
   ii. Members of devteam can still create and delete files

<img width="778" height="425" alt="Screenshot_9" src="https://github.com/user-attachments/assets/5993db0a-1dcb-42a5-bf7f-24dd3437aeb7" />

---

## 10. Make Readme read-only
 
a. The README.md file should:
   i. Be readable by everyone
   ii. Writable only by the owner
   iii. Not executable by anyone
 
b. Use numeric/absolute permissions.

<img width="625" height="254" alt="Screenshot_10" src="https://github.com/user-attachments/assets/f4ffb009-97a3-42bb-8d0a-c6b6e4bad103" />

---

## 11. Resignation and project handover
 
a. Transfer all ownership to dako
 
b. Change:
   i. Owner of all files and directories → dako
   ii. Group remains devteam
 
c. Verify

<img width="730" height="430" alt="Screenshot_11" src="https://github.com/user-attachments/assets/1c537595-8f42-4987-aba8-50aff09a9077" />

---
